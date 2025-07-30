{
config,
pkgs,
...
}: {
    programs.nixvim = {

    enable = true;
       globals.mapleader = " ";


        opts = {
            number = true;
            relativenumber = true;

            scrolloff = 8;
            tabstop = 4;
            expandtab = true;
            softtabstop = 4;
            shiftwidth = 4;

            signcolumn = "yes";
            winborder = "rounded";

            updatetime = 50;
        };
        keymaps = [
            {
                action = ":Oil<CR>";
                key = "-";
            }
            {
                key = "<leader>cf";
                action.__raw = "function() require('conform').format() end";
            }

            {
                key = "<leader>p";
                mode = "x";
                action = "\"_dP";
            }
            {
                key = "<leader>y";
                mode = [
                    "n"
                    "v"
                ];
                action = "\"+y";
            }
            {
                key = "<leader>Y";
                mode = "n";
                action = "\"+Y";
            }
            {
                key = "<leader>d";
                mode = [
                    "n"
                    "v"
                ];
                action = "\"_d";
            }
            {

                key="J";
                mode = "v";
                action=":m '>+1<CR>gv=gv";
            }
            {

                key="K";
                mode = "v";
                action=":m '<-2<CR>gv=gv";
            }
            
        ];


        colorschemes.catppuccin = {
            enable = true;
            settings.transparent_background = true;
        };

        plugins = {
            lsp = {
                enable = true;
                servers= {
                    ts_ls.enable = true;
                    nixd.enable = true;
                };
                keymaps.lspBuf = {
                    K = "hover";
                    gD = "references";
                    gd = "definition";
                    gi = "implementation";
                    gt = "type_definition";
                };

            };
            blink-cmp = {
                enable = true;
                settings.signature.enabled = true;
            };
            treesitter = {
                enable = true;
                settings = {
                    auto_install = true;
                    # ensure_installed = "all";
                    highlight.enable = true;
                    indent.enable = true;
                };
            };
            conform-nvim = {
                enable = true;
                settings = {
                    formatters_by_ft = {
                        javascript = ["prettier"];
                        typescript = ["prettier"];
                    };
                };
            };
            nvim-autopairs.enable = true;
            # Still deciding if I like this
            smear-cursor = {
                enable = true;
                settings =  {                                
                    stiffness = 0.8;
                    trailing_stiffness = 0.5;
                    stiffness_insert_mode = 0.7;
                    trailing_stiffness_insert_mode = 0.7; 
                    damping = 0.8;                       
                    damping_insert_mode = 0.8;
                    distance_stop_animating = 0.5;
                };
            };
            web-devicons.enable = true;
            fzf-lua = {
                enable = true;
                keymaps = {
                    "<leader>ff" = "files";
                    "<leader>fs" = "live_grep";
                    "<leader>fb" = "buffers";
                    "<leader>vh" = "helptags";
                    "<C-p>" = "git_files";
                };
            };
            which-key.enable = true;
            oil.enable = true;
            hardtime.enable = true;
        };

    };
}
