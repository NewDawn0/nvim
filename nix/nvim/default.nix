{ callPackage
, lib
}: let
  presets = import ../presets.nix;
in {
  fromPreset = p: with lib; makeOverridable
    (callPackage ./builder.nix {})
    (recursiveUpdate presets.minimal p);
}
