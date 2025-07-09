{ config, pkgs, ... }:
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -f -i /home/evank/nixos/home/wallpaper.png";
      }
      {
        timeout = 360;
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -f -i /home/evank/nixos/home/wallpaper.png";
      }
    ];
  };
}
