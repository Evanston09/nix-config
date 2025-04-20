{ lib, config, pkgs, ... }:
{
    wayland.windowManager.sway = {
        # Need this bc: https://github.com/nix-community/home-manager/issues/5311
        checkConfig = false;

        enable = true;
        config = rec {
            bars = [{statusCommand = "i3status";}];
            terminal = "ghostty";
            modifier = "Mod4";
            defaultWorkspace = "workspace number 1";
            input = {
                "type:touchpad" = {
                    dwt = "enabled";
                    tap = "enabled";
                    middle_emulation = "enabled";
                };
            };
            output = {
                "*" = {
                    background = "/home/evank/Downloads/wallpaper.tiff fill";
                };
            };
            keybindings = let
                modifier = config.wayland.windowManager.sway.config.modifier;
            in lib.mkOptionDefault {
                    "XF86MonBrightnessDown" = "exec light -U 10";
                    "XF86MonBrightnessUp" = "exec light -A 10";

                    "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +5%'";
                    "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -5%'";
                    "XF86AudioMute" = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";

                    "${modifier}+end" = "exec 'systemctl suspend'";

                    "${modifier}+shift+n" = "exec 'swaync-client -t -sw'";
                };
            menu = "bemenu-run";
        };

        extraConfig = "
        for_window [class=\"^.*\"] border pixel 2
            ";
    };
}
