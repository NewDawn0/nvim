{ lib
, vimUtils
}: let
in {
  mkRC = { modules, rcPath, support }: let
    installModules = ''
      # Remove old
      rm -rf $out/lua/cfg
      mkdir -p $out/lua/cfg
      ${with lib; concatStringsSep "\n" (
        (map (x: "cp ${rcPath}/lua/cfg/${x}.lua $out/lua/cfg/${x}.lua")
        modules))}
    '';
    initLua = builtins.toFile "_" (with lib; concatStringsSep "\n" (lists.flatten [
      "vim.g.support = ${lib.pcall-me-maybe.anyToLua support}"
      "${builtins.readFile "${rcPath}/init.lua"}"
      # TODO: Remove once we have a proper plugin system
      (map (x: ''require("cfg.${x}")'') modules)
    ]));
  in vimUtils.buildVimPlugin {
    name = "nvim-config";
    pname = "nvim-config";
    doCheck = false;
    src = lib.cleanSource rcPath;
    postInstall = ''
      ${installModules}
      install -Dm644 ${initLua} $out/init.lua
    '';
  };
}
