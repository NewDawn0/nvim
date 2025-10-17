{ callPackage
, lib
}: let
  nvim = callPackage ./nvim { };
  defaults = {
    aliases = ["vi" "vim"];
    support = {
      all = false;
      ansible = false;
      arduino = false;
      lua = true;
      nix = true;
    };
  };
in lib.makeOverridable nvim defaults
