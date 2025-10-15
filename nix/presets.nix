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
        all = false;
        lua = true;
        nix = true;
        ansible = true;
        arduino = true;
      };
    };
  };
in presets
