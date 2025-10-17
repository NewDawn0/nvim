{ callPackage
, lib
, makeWrapper
, neovim
, vimPlugins
}:
{ aliases
, support
}: let
  util = callPackage ./util.nix {};
  finalPkgs = callPackage ../runtime { inherit support; };
  nvimRC = util.mkRC { inherit support; rcPath = ../../nvim; };
in (neovim.override {
  configure = {
    customRC = ''lua dofile("${nvimRC}/init.lua")'';
    packages.all = {
      start = map (lib.pcall-me-maybe.compilePlugin) ([ nvimRC ] ++ (callPackage ../plugins.nix {}));
      opt = [];
    };
  };
}).overrideAttrs (old: {
  nativeBuildInputs = old.nativeBuildInputs ++ [makeWrapper];
  postInstall = ''
    ${old.postInstall or ""}
    wrapProgram $out/bin/nvim \
      --prefix PATH : "${lib.makeBinPath finalPkgs}"
    ${with lib; concatStringsSep "\n"
      (map (x: "ln -s $out/bin/nvim $out/bin/${x}")
      (filter (x: x != "nvim") aliases))}
  '';
})
