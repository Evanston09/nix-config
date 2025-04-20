{ config, pkgs, ... }:
{
    services.swayidle = {
        enable = true;
        timeouts = [
            {
                timeout = 300;
                command = "${pkgs.swaylock}/bin/swaylock -f -i /home/evank/Downloads/wallpaper.tiff";
            }
            {
                timeout = 360;
                command = "${pkgs.sway}/bin/swaymsg 'output * power off'";
                resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * power on'";
            }
        ];
        events = [
            {
                event = "before-sleep";
                command = "${pkgs.swaylock}/bin/swaylock -f -i /home/evank/Downloads/wallpaper.tiff";
            }
        ];
    };
}
