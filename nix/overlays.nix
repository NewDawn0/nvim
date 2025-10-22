final: prev: {
  vimPlugins = prev.vimPlugins // {
    better-utils = prev.vimUtils.buildVimPlugin {
      name  = "improved-utils";
      pname = "improved-utils";
      src   = prev.lib.cleanSource ../plugins;
    };
  };
}
