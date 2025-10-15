{vimPlugins}: with vimPlugins; [
  # Core
  blink-cmp                     # cfg.cmp -> luasnip, nvim-lspconfig
  boole-nvim                    # cfg.boole
  catppuccin-nvim               # cfg.theme
  friendly-snippets             # --
  luasnip                       # cfg.snippets -> friendly-snippets
  mini-pairs                    # setup-fn
  nvim-lspconfig                # -> cfg.lsps
  nvim-web-devicons             # --
  oil-nvim                      # cfg.oil -> nvim-web-devicons
  plenary-nvim                  # --
  telescope-dap-nvim            # --
  telescope-fzf-native-nvim     # --
  telescope-git-conflicts-nvim  # --
  telescope-media-files-nvim    # --
  telescope-nvim                # cfg.telescope -> nvim-web-devicons, plenary-nvim, telescope-dap-nvim, telescope-fzf-native-nvim, telescope-git-conflicts-nvim, telescope-media-files-nvim
  trim-nvim                     # cfg.trim
  # Extra
  nvim-notify                   # cfg.notify
  supermaven-nvim               # cfg.supermaven
]
