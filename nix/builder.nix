{ callPackage
, lib
, makeWrapper
, neovim
}:
{ aliases
, runtime
, support
}: let
  finalPkgs = runtime
    ++ (callPackage ./runtime { inherit support; });
in (neovim.override {
  configure = {
    packages.all = {
      start = (callPackage ./plugins.nix {});
    };
    customRC = ''
      lua dofile("${../nvim/init.lua}")
    '';
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
