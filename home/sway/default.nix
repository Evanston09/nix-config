
{ config, pkgs, ... }:
{
    imports = [
        ./i3status.nix
        ./sway.nix
        ./swayidle.nix
        ./swaylock.nix
        ./swaync.nix
    ];
}
