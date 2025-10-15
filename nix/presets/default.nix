{ callPackage
, lib
}: let
  profiles = callPackage ./profiles.nix {};
  concatProfiles = presets: {
    modules = lib.concatMap (p: p.modules) presets;
    plugins = lib.concatMap (p: p.plugins) presets;
  };
  presets = {
    default = presets.minimal;
    minimal = {
      inherit (concatProfiles (with profiles; [ minimal ])) modules plugins;
      aliases = ["vi" "vim"];
      runtime = [];
      support = {
        all = false;
        lua = true;
        nix = true;
        ansible = true;
        arduino = true;
      };
    };
  };
in presets
