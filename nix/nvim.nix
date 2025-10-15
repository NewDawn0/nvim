{ callPackage
, neovim
}: neovim.override {
  configure = {
    packages.all = {
      start = (callPackage ./plugins.nix {});
    };
    customRC = ''
      lua dofile("${../nvim/init.lua}")
    '';
  };
}
