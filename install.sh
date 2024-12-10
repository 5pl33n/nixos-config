#!/bin/sh

nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /mnt/home/spleen/nixos-config/disko.nix
nixos-generate-config --root /mnt --show-hardware-config > /mnt/etc/nixos/hardware-configuration.nix
nixos-install --flake /root/nixos-config/#jackdow
home-manager build --flake /root/nixos-config/#spleen
