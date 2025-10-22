{vimPlugins}: with vimPlugins; [
  # Core
  blink-cmp                     # opt.cmp -> luasnip, nvim-lspconfig
  boole-nvim                    # opt.boole
  catppuccin-nvim               # opt.theme
  friendly-snippets             # --
  luasnip                       # opt.snippets -> friendly-snippets
  mini-pairs                    # setup-fn
  mini-surround                 # opt.surround
  nvim-lspconfig                # -> opt.lsps
  nvim-web-devicons             # --
  oil-nvim                      # opt.oil -> nvim-web-devicons
  plenary-nvim                  # --
  telescope-dap-nvim            # --
  telescope-fzf-native-nvim     # --
  telescope-git-conflicts-nvim  # --
  telescope-nvim                # opt.telescope -> nvim-web-devicons, plenary-nvim, telescope-dap-nvim, telescope-fzf-native-nvim, telescope-git-conflicts-nvim
  trim-nvim                     # opt.trim
  # Extra
  nvim-notify                   # opt.notify
  supermaven-nvim               # opt.supermaven
  nvim-cokeline                 # opt.cokeline
  nvim-colorizer-lua            # opt.colorizer
  vim-tmux-navigator            # opt.tmux
  markdown-preview-nvim         # --
  typst-preview-nvim            # setup-fn
  better-utils                  # --
  nvim-treesitter.withAllGrammars
]
