{ callPackage
, lib
}: let
  presets = callPackage ../presets {};
in {
  fromPreset = p: with lib; makeOverridable
    (callPackage ./builder.nix {})
    (recursiveUpdate presets.minimal p);
}
