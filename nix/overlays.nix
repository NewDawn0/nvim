final: prev: {
  vimPlugins = prev.vimPlugins // {
    custom = prev.vimUtils.buildVimPlugin {
      name = "custom";
      pname = "custom";
      src = prev.lib.cleanSource ./custom;
    };
  };
}
