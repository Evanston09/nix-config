{ config, pkgs, ... }:
{
    imports = [
        ./niri.nix
        ./mako.nix
        ./swayidle.nix
        ./swaylock.nix
    ];
}
