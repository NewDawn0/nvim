{vimPlugins}: {
  minimal = {
    modules = ["boole" "oil" "theme" "trim" "cmp" "notify"  "snippets"];
    plugins = with vimPlugins; [
      blink-cmp         # cfg.cmp -> luasnip, nvim-lspconfig
      boole-nvim        # cfg.boole
      catppuccin-nvim   # cfg.theme
      friendly-snippets #
      luasnip           # cfg.snippets -> friendly-snippets
      mini-pairs        # setup-fn
      nvim-lspconfig    # -> cfg.lsps
      nvim-web-devicons #
      oil-nvim          # cfg.oil -> nvim-web-devicons
      trim-nvim         # cfg.trim

      nvim-notify       # cfg.notify
    ];
  };
}
