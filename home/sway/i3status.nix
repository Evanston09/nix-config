{ config, pkgs, ... }:
{
    programs.i3status = {
        enable = true;
        modules = {
            "memory".enable = false;
            "ipv6".enable = false;
            "disk /".enable = false;
            "load".enable = false;
            "volume master" = {
                position = 4;
                settings = {
                    format = "♪ %volume";
                    format_muted = "♪ muted (%volume)";
                    device = "default";
                    mixer = "Master";
                    mixer_idx = 0;
                };
            };
        };
    };
}
