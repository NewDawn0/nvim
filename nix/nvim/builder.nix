{ callPackage
, lib
, makeWrapper
, neovim
, vimPlugins
}:
{ aliases
, runtime
, support
}: let
  util = callPackage ./util.nix {};
  finalPkgs = runtime
    ++ (callPackage ../runtime { inherit support; });
  nvimRC = util.mkRC { inherit support; rcPath = ../../nvim; };
in (neovim.override {
  configure = {
    customRC = ''lua dofile("${nvimRC}/init.lua")'';
    packages.all = {
      start = [ nvimRC vimPlugins.custom ] ++ (callPackage ../plugins.nix {});
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
