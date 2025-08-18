#!/usr/bin/env bash

# 1. Generate age key for new device and add it to secrets files
# 2. Generate keyfiles for any non-root disks and create a filestructure-mock of the nix secrets location to emulate that during install
# 3. Add keyfile contents to system secrets
# 4. Install using nixos-anywhere. Disk secrets just stay as hard files for now.
# 5. SSH into target
# 6. Copy local nix config to target
# 7. Generate age key from target ssh host key and add it to secrets using custom key that was created and authorized on the source machine pre install
# 8. Remove disk decryption file that was installed in the nix secrets location
# 9. Rebuild using the full configuration
# 10. Install home manager config

set -euo pipefail

if [ -z ${LIYUA_FLAKE_SHELL+x} ]; then
  echo "Please run this from the default flake shell to ensure the availability of all required tools!"
  exit 1
fi

temp=$(mktemp -d)

function cleanup() {
  rm -rf "$temp"
}

trap cleanup exit

target_hostname=""
target_destination=""
target_user="$(whoami)"
ssh_port=22
ssh_key=""
luks_password="password"
git_root=$(git rev-parse --show-toplevel)
sops_file="$git_root/.sops.yaml"

function help_quit() {
  echo "Help goes here!" # TODO: Add some help stuff
}

while [[ $# -gt 0 ]]; do
  case "$1" in
  -n)
    shift
    target_hostname=$1
    ;;
  -d)
    shift
    target_destination=$1
    ;;
  -u)
    shift
    target_user=$1
    ;;
  -k)
    shift
    ssh_key=$1
    ;;
  -p)
    shift
    ssh_port=$1
    ;;
  --debug)
    set -x
    ;;
  -h | --help) help_quit ;;
  *) help_quit ;;
  esac
  shift
done

if [ -z "$target_hostname" ] || [ -z "$target_destination" ] || [ -z "$ssh_key" ]; then
  echo "Please provide -n, -d and -k"
  help_quit
fi

ssh_cmd="ssh -i $ssh_key -p $ssh_port -t $target_user@$target_destination"

function generate_age_key() {
  age-keygen -o "$temp/private.key"
  age-keygen -y -o "$temp/public.key" "$temp/private.key"
}

function add_age_key() {
  field="$1"
  keyname="$2"
  key="$3"

  if [[ -n $(ya ".keys.${field}[] | select(anchor == \"$keyname\")" "$sops_file") ]]; then
    echo "Updating key"
    yq -i "(.keys.${field}[] | select(anchor == \"$keyname\")) = \"$key\"" "$sops_file"
  else
    echo "Adding new key"
    yq -i ".keys.$field += [\"$key\"] | .keys.${field}[-1] anchor = \"$keyname\"" "$sops_file"
  fi
}

function update_creation_rules() {
  host_keys="$(yq "(.keys[] | select(.hosts | type == \"array\")).hosts[]" "$sops_file")"
  host_anchors=""
  echo "$host_keys" | while read -r key; do
    host_anchors=${host_anchors+"$(yq "(.keys[] | select(.hosts | type == \"array\")).hosts[] | select(value == $key)")\n"}
    echo "$key"
  done
  echo "$host_anchors"
}
update_creation_rules
