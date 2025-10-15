{ lib
, vimUtils
}: let
in {
  mkRC = { rcPath, support }: let
    initLua = builtins.toFile "_" (with lib; concatStringsSep "\n" [
      "vim.g.support = ${pcall-me-maybe.anyToLua support}"
      "${builtins.readFile "${rcPath}/init.lua"}"
      # TODO: Remove once we have a proper plugin system
    ]);
  in vimUtils.buildVimPlugin {
    name = "nvim-config";
    pname = "nvim-config";
    doCheck = false;
    src = lib.cleanSource rcPath;
    postInstall = ''
      install -Dm644 ${initLua} $out/init.lua
    '';
  };
}
