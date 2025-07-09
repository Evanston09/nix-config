{ config, pkgs, ... }:
{
    imports = [
        ./niri.nix
        ./waybar.nix
        ./tofi.nix
        ./mako.nix
        ./swayidle.nix
        ./swaylock.nix
    ];
}
