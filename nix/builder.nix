{ callPackage
, lib
, makeWrapper
, neovim
, vimUtils
}:
{ aliases
, runtime
, support
}: let
  finalPkgs = runtime
    ++ (callPackage ./runtime { inherit support; });
  nvimRC = vimUtils.buildVimPlugin {
    name = "nvim-config";
    pname = "nvim-config";
    doCheck = false;
    src = lib.cleanSource ../nvim;
  };
in (neovim.override {
  configure = {
    customRC = ''lua dofile("${nvimRC}/init.lua")'';
    packages.all = {
      start = [ nvimRC ] ++ (callPackage ./plugins.nix {});
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
