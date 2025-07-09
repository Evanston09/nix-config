{ config, pkgs, ... }:
{
    programs.waybar  = {
        enable = true;
        style = ''
          window#waybar {
              background-color: transparent;
        }

        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #pulseaudio,
        #wireplumber,
        #custom-media,
        #tray,
        #mode,
        #idle_inhibitor,
        #scratchpad,
        #power-profiles-daemon,
        #mpd {
            padding: 0 10px;
        }
         '';

        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                spacing = 4;
                height = 30;
                modules-left = [ "niri/workspaces" "niri/window" ];
                modules-center = [ "clock" ];
                modules-right = [ "network" "pulseaudio" "battery"];

                network = {
                    format-wifi = "{essid} ({signalStrength}%) ";
                    format-ethernet = "{ipaddr}/{cidr} ";
                    tooltip-format = "{ifname} via {gwaddr} ";
                    format-linked = "{ifname} (No IP) ";
                    format-disconnected = "Disconnected ⚠";
                    format-alt = "{ifname}: {ipaddr}/{cidr}";
                };
                pulseaudio = {
                    # scroll-step = 1; # Optional, uncomment to enable
                    format = "{volume}% {icon} {format_source}";
                    format-bluetooth = "{volume}% {icon}  {format_source}";
                    format-bluetooth-muted = "  {icon}  {format_source}";
                    format-muted = "  {format_source}";
                    format-source = "{volume}% ";
                    format-source-muted = "";
                    format-icons = {
                        headphone = "";
                        "hands-free" = "";
                        headset = "";
                        phone = "";
                        portable = "";
                        car = "";
                        default = [ "" "" "" ];
                    };
                    on-click = "pavucontrol";
                };
                battery = {
                    states = {
                        warning = 30;
                        critical = 15;
                    };
                    format = "{capacity}% {icon}";
                    format-full = "{capacity}% {icon}";
                    format-charging = "{capacity}% ";
                    format-plugged = "{capacity}% ";
                    format-alt = "{time} {icon}";
                    format-icons = [ "" "" "" "" "" ];
                };
                clock = {
                    format = "{:%a, %b %d %H:%M}"; # Example: "Thu, Jul 04 00:28"
                    tooltip-format = "{:%A, %B %d, %Y %H:%M}"; # Tooltip with full details
                };
            };
        };

    };
}

