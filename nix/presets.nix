let
  presets = {
    default = presets.minimal;
    full = presets.minimal;
    minimal = {
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
