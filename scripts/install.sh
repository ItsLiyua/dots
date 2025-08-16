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

temp=$(mktemp -d)

function cleanup() {
  rm -rf "$temp"
}

trap cleanup exit

target_hostname=""
target_destination=""
target_user=""
ssh_port=22
ssh_key=""
luks_password="password"
git_root=$(git rev-parse --show-toplevel)

function help_quit() {
  echo "Help goes here!" # TODO: Add some help stuff
}
