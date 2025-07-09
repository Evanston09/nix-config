{ config, pkgs, lib, inputs, ... }:

{
    home.username = "evank";
    home.homeDirectory = "/home/evank";

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
        pkgs.gcc
        pkgs.android-studio
        pkgs.android-tools
        pkgs.bambu-studio
        pkgs.kdePackages.kleopatra
        pkgs.dconf
    ];
    services.kdeconnect.enable = true;
    services.mpris-proxy.enable = true;

    imports = [
        inputs.niri.homeModules.niri
        inputs.niri.homeModules.stylix
        inputs.nvf.homeManagerModules.default
        inputs.stylix.homeModules.stylix
        ./niri
        ./nvim
    ];
    # Stylix
    stylix = {
        enable = true;
        # I dont want it to touch neovim
        targets.nvf.enable = false;
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
            emoji = config.stylix.fonts.sansSerif;
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
        initContent = "source ~/.p10k.zsh";
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
        userEmail = "evanhkim09@gmail.com";
        userName = "Evanston09";
    };

    programs.mpv.enable = true;

    programs.zoxide.enable = true;

    programs.lazygit.enable = true;

    home.stateVersion = "25.05";
}
