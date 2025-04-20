{ config, pkgs, lib, ... }:

{
  home.username = "evank";
  home.homeDirectory = "/home/evank";

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };
    gtk = {
        enable = true;

        gtk3.extraConfig = {
            "gtk-application-prefer-dark-theme" = "1";
        };

        gtk4.extraConfig = {
            "gtk-application-prefer-dark-theme" = "1";
        };
    };

  home.packages = [
    pkgs.pavucontrol
    pkgs.grim
    pkgs.slurp
    pkgs.blueman
    pkgs.firefox
    pkgs.neofetch
    pkgs.bemenu
    pkgs.zsh-powerlevel10k
    pkgs.localsend
    pkgs.discord
  ];

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

    programs.swaylock.enable = true;
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
  
  services.swaync.enable = true;
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
  
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      font-size = 12;
      background-opacity = .8;
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [{
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }];
    initExtra = "source ~/.p10k.zsh";
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true; # see note on other shells below
    nix-direnv.enable = true;
  };

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    keyMode = "vi";
    mouse = true;
    baseIndex = 1;
    customPaneNavigationAndResize = true;
    terminal = "screen-256color";
    extraConfig = "
      bind '\\' split-window -h
      bind - split-window -v
      set -g status-style bg=default
    ";
  };

  programs.git = {
    enable = true;
    userEmail = "evanhkim09@gmail.com";
    userName = "Evanston09";
  };

  programs.mpv.enable = true;

  programs.zoxide.enable = true;

  programs.nvf = {
    enable = true;

    settings.vim = {
      options = {
        scrolloff = 8;
        
        tabstop = 4;
        expandtab = true;
        softtabstop = 4;
        shiftwidth = 4;
       
        updatetime = 50;
      };
      keymaps = [
       {
         key = "<leader>ff";
         mode = "n";
         lua = true;
         action = "function()
           require('fzf-lua').files()
         end";
        }
        {
         key = "<leader>fs";
         mode = "n";
         lua = true;
         action = "function()
           require('fzf-lua').live_grep()
         end";
        }
        {
         key = "<C-p>";
         mode = "n";
         lua = true;
         action = "function()
           require('fzf-lua').git_files()
         end";
        }
        {
         key = "<leader>fb";
         mode = "n";
         lua = true;
         action = "function()
           require('fzf-lua').buffers()
         end";
        }
        {
         key = "<leader>vh";
         mode = "n";
         lua = true;
         action = "function()
           require('fzf-lua').helptags()
         end";
        }

        {
          key = "-";
          mode = "n";
          action = "<CMD>Oil<CR>";
        }

        {
          key = "<leader>p";
          mode = "x";
          action = "\"_dP";
        }
        {
          key = "<leader>y";
          mode = ["n" "v"];
          action = "\"+y";
        }
        {
          key = "<leader>Y";
          mode = "n";
          action = "\"+Y";
        }
        {
          key = "<leader>d";
          mode = ["n" "v"];
          action = "\"_d";
        }

        {
          key = "<C-d>";
          mode = "n";
          action = "<C-d>zz";
        }
        {
          key = "<C-u>";
          mode = "n";
          action = "<C-u>zz";
        }
      ];
      utility.oil-nvim.enable = true;
      fzf-lua.enable = true;
      mini = {
        ai.enable = true;
        comment.enable = true;
        pairs.enable = true;
        move.enable = true;
        surround.enable = true;
        splitjoin.enable = true;
      };
      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = true;
      };
      visuals.nvim-web-devicons.enable = true;
      autocomplete.blink-cmp = {
        enable = true;
        setupOpts = {
          signature = {enabled=true;};
          keymap.preset = "default";
        };
      };

      diagnostics = {
        enable = true;
        config.virtual_text = true;
      };
     
      languages = {
        enableLSP = true;
        enableTreesitter = true;

        lua.enable = true;
        nix.enable = true;
        astro.enable = true;
        ts.enable = true;
        html.enable = true;
        css.enable = true;
      };
    };
  };

  programs.lazygit.enable = true;


  home.stateVersion = "25.05";
}
