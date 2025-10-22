{ callPackage
, lib
}: let
  presets = import ./presets.nix;
  nvim-bld = lib.makeOverridable (callPackage ./nvim { });
  nvim = nvim-bld presets.none;
  withPresets = f: nvim-bld (with lib; foldl' recursiveUpdate {} ([presets.none] ++ (f presets)));
  nvimWithAttrs = nvim // {
    inherit withPresets;
  };
in nvimWithAttrs
