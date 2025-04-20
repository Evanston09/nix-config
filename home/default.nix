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

    imports = [
        ./sway
        ./nvim
    ];

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

    programs.lazygit.enable = true;


    home.stateVersion = "25.05";
}
