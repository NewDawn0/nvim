{ lib
, vimUtils
}: let
in {
  mkRC = { modules, rcPath }: let
    installModules = with lib; concatStringsSep "\n"
      (map (x: "cp ${rcPath}/lua/cfg/${x}.lua $out/lua/cfg/${x}.lua") modules);
    # TODO: Remove once we have a proper plugin system
    genRequires = with lib; concatStringsSep "\n"
      (map (x: ''require("cfg.${x}")'') modules);
      # echo ${genRequires} >> $out/init.lua
  in vimUtils.buildVimPlugin {
    name = "nvim-config";
    pname = "nvim-config";
    doCheck = false;
    src = lib.cleanSource rcPath;
    postInstall = ''
      rm -rf $out/lua/cfg
      mkdir -p $out/lua/cfg
      ${installModules}
      cat <<EOF >> $out/init.lua
      ${genRequires}
      EOF
    '';
  };
}
