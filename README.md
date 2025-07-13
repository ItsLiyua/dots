# Liyuas Nix Flake

<!--toc:start-->

- [Liyuas Nix Flake](#liyuas-nix-flake)
  - [Installation](#installation)
    - [System](#system)
    - [User](#user)
  - [TODOs](#todos)

<!--toc:end-->

This is the nix flake which I use for my home setup. It contains configuration
for both servers and regular desktop devices. The repository contains two
branches. `system` contains the NixOS configuration for the operating system.
`user` contains the Home Manager configuration for my user.

## Installation

### System

It is recommended to clone this repo into two separate directories for the
system and user configuration after installing NixOS using the default
installer. For the system configuration I recommend `~/nix` with a symlink to
`/etc/nixos` and for the home manager configuration I recommend
`~/.config/home-manager`.

> [!INFO]
> For a raspberry pi it is recommended to check out
> [nvmd/nixos-raspberrypi](https://github.com/nvmd/nixos-raspberrypi). Examples
> can be found in the configurations for `rpi5-1` and `rpi5-2`.

Then you'll have to create a new system configuration with a unique hostname in
the `flake.nix` file. The recommended structure is to place the new
configuration in `./hosts/<hostname>/default.nix`. Every file in there should
only ever be accessed by that specific configuration. Everything else should be
placed in `./hosts/common/core/` if it is relevant to all configurations or in
`./hosts/common/optional` if it is only required for some configurations (make
sure to create a switch for it in `./modules/`)

You'll also have to generate a new public age key for sops from the host ssh key
(located at `/etc/ssh/ssh_host_ed25519_key`) and add it to the `.sops.yaml` file
contained in the repository. If the ssh host key doesn't exist yet you'll have
to access the new device via ssh using an `ed25519` key at least once.

To generate the public key you can use:

```nix
nix-shell -p ssh-to-age --run "doas ssh-to-age -i /etc/ssh/ssh_host_ed25519_key.pub"
```

> [!INFO]
> Only the public age key has to be created for `sops`. The private key will be
> generated automatically as soon as a rebuild is triggered. This means it is
> important that the user key (`.config/sops/age/keys.txt`) is backed up
> somewhere in case you lose or reset your ssh host keys because if the host key
> is lost you'll need the user key to add a new public age key generated from
> the ssh host key.

After adding the key to the `.sops.yaml` file you have to update the encryption
of the `secrets.yaml` file. To do that you first have to import the user key
from an existing configuration (located at `.config/sops/age/keys.txt`) which
will be used to add the new key to `secrets.yaml`. To add the new public key to
the encryption you need to run:

```nix
sops updatekeys ./secrets.yaml
```

It can also be used to add or modify existing secrets using the `sops` command.

After updating the secret encryption you have to rebuild the system and commit
any changes you made while adding the new configuration or updating the
encryption. To rebuild for the first time use

```nix
sudo nixos-rebuild --flake ".#<hostname>"
```

After the first rebuild `nh` will be installed and can be used from hereon out.

### User

The user configuration is way easier to install since it doesn't require
generating a new key (yet). Just clone the repo into `~/.config/home-manager`
and create a new `homeConfiguration` in `flake.nix`. The naming scheme is very
similar to the system level configuration but instead of all configuration
living in `./hosts/` they live in `./liyua/`. Since there isn't much
per-device-configuration in userspace it's usually not necessary to create a
separate directory for each host. I just use a single file per host.

## TODOs

> [!NOTE]
> `hostname: text` means this todo element is relevant for that hostname.\
> `common: text` means this todo element is relevant to multiple
> configurations.\
> `liyua@hostname: text` means this element is relevant to the user
> configuration on a specific hostname.\
> `liyua@common: text` means this element is relevant to multiple user
> configurations.

- [ ] resolute: Add GoXLR
- [ ] resolute: Add OpenRGB
- [ ] rpi5-2: Add actual for budgeting

- [ ] liyua@common: Split up niri config into multiple files
- [ ] liyua@common: Remove as many GNOME dependencies from niri as possible
- [ ] liyua@resolute: Migrate to niri
- [ ] liyua@resolute: Remove NetworkManager dependency from steam package
