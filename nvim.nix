{ neovim
}: neovim.override {
  configure = {
    customRC = ''
      lua dofile("${./nvim/init.lua}")
    '';
  };
}
