{ config, pkgs, ... }:
{
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
}
