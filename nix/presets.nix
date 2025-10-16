let
  shared = {
    aliases = ["vi" "vim"];
    runtime = [];
  };
  presets = {
    default = presets.minimal;
    full = presets.minimal;
    minimal = {
      inherit (shared) aliases runtime;
      support = {
        utility = {};
        langs = {
          all = false;
          lua = true;
          nix = true;
          ansible = true;
          arduino = true;
        };
        ui = {};
      };
    };
  };
in presets
