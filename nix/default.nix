{ callPackage
, lib
}: let
  nvim = callPackage ./nvim { };
  defaults = {
    aliases = ["vi" "vim"];
    support = {
      all = true;
      angular = false;
      ansible = false;
      arduino = false;
      assembly = false;
      astro = false;
      awk = false;
      lua = true;
      make = false;
      nix = true;
    };
  };
in lib.makeOverridable nvim defaults
