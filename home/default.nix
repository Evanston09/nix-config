{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  home.username = "evank";
  home.homeDirectory = "/home/evank";

  home.packages = [
    pkgs.pavucontrol
    pkgs.grim
    pkgs.slurp
    pkgs.blueman
    pkgs.firefox
    pkgs.fastfetch
    pkgs.bemenu
    pkgs.zsh-powerlevel10k
    pkgs.localsend
    pkgs.discord
    pkgs.gcc
    pkgs.android-studio
    pkgs.android-tools
    # pkgs.bambu-studio
    pkgs.kdePackages.kleopatra
    pkgs.dconf
    pkgs.nixfmt-tree
    pkgs.nodejs
    pkgs.youtube-music
    pkgs.bruno
    pkgs.timer
    pkgs.xfce.thunar
    pkgs.calibre
  ];
  services.kdeconnect.enable = true;
  services.mpris-proxy.enable = true;
  programs.chromium.enable = true;
  programs.zen-browser.enable = true;

  imports = [
    inputs.niri.homeModules.niri
    inputs.niri.homeModules.stylix
    inputs.nixvim.homeModules.nixvim
    inputs.stylix.homeModules.stylix
    inputs.zen-browser.homeModules.beta
    ./niri
    ./nvim
  ];

  # Stylix
    stylix = {
        enable = true;
        targets.nixvim.enable = false;
        targets.gnome.enable = true;
        targets.zen-browser.profileNames = ["default"];
        opacity.terminal = 0.8;
        fonts = {
            monospace = {
                package = pkgs.nerd-fonts.jetbrains-mono;
                name = "JetBrainsMono Nerd Font";
            };
            sansSerif = {
                package = pkgs.roboto;
                name = "Roboto";
            };
            serif = config.stylix.fonts.sansSerif;
            emoji = config.stylix.fonts.monospace;
        };
        cursor = {
            name = "Adwaita";
            package = pkgs.adwaita-icon-theme;
            size = 24;
        };
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    };

  programs.ghostty = {
    enable = true;
    settings = {
      window-decoration = "none";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    initContent = ''
      source ~/.p10k.zsh

      # Pomodoro timer function thanks to bashbunni
      declare -A pomo_options
      pomo_options["work"]="45"
      pomo_options["break"]="10"

      pomodoro () {
        if [ -n "$1" ] && [ -n "''${pomo_options["$1"]}" ]; then
          val=$1
          echo $val
          timer "''${pomo_options["$val"]}m"
        fi
      }
    '';

    shellAliases = {
      wo = "pomodoro work";
      br = "pomodoro break";
    };
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
            ";
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    userEmail = "evanhkim09@gmail.com";
    userName = "Evanston09";
  };

  programs.mpv.enable = true;

  programs.zoxide.enable = true;

  programs.lazygit.enable = true;

  home.stateVersion = "25.05";
}
