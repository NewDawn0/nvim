{ callPackage
, lib
, makeWrapper
, neovim
}:
{ aliases
, modules
, plugins
, runtime
, support
}: let
  util = callPackage ./util.nix {};
  finalPkgs = runtime
    ++ (callPackage ../runtime { inherit support; });
  nvimRC = util.mkRC { inherit modules; rcPath = ../../nvim; };
in (neovim.override {
  configure = {
    customRC = ''lua dofile("${nvimRC}/init.lua")'';
    packages.all = {
      start = [ nvimRC ] ++ plugins;
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
