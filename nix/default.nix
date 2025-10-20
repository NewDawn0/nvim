{ callPackage
, lib
}: let
  nvim = callPackage ./nvim { };
  defaults = {
    aliases = ["vi" "vim"];
    support = {
      all = true;
      ansible = false;
      arduino = false;
      assembly = false;
      lua = true;
      nix = true;
    };
  };
in lib.makeOverridable nvim defaults
