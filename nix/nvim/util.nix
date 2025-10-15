{ lib
, vimUtils
}: {
  mkRC = { rcPath }: vimUtils.buildVimPlugin {
    name = "nvim-config";
    pname = "nvim-config";
    doCheck = false;
    src = lib.cleanSource rcPath;
  };
}
