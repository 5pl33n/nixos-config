#!/bin/sh

rm -rf /root/nixos-config/.git
nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /root/nixos-config/disko.nix
nixos-generate-config --show-hardware-config > /root/nixos-config/nixos/hardware-configuration.nix
nixos-install --flake /root/nixos-config/#jackdow

