#!/bin/sh

nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /root/nixos-config/disko.nix
nixos-generate-config --root /mnt
nixos-install
