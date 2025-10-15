{vimPlugins}: {
  minimal = {
    modules = ["boole" "oil" "theme" "trim"];
    plugins = with vimPlugins; [
      boole-nvim        # cfg.boole
      catppuccin-nvim   # cfg.theme
      mini-pairs        # setup-fn
      oil-nvim          # cfg.oil -> nvim-web-devicons
      trim-nvim         # cfg.trim
      nvim-lspconfig    # -> cfg.lsps
      nvim-web-devicons #
    ];
  };
}
