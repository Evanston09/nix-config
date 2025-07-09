{ config, pkgs, lib, ... }:
{
    services.mako.enable = true;
    programs.hyprlock = {
        enable = true;
        # settings = {
        #     background = [
        #         {
        #             blur_passes = 3;
        #             blur_size = 8;
        #         }
        #     ];
        # };
    };

}
