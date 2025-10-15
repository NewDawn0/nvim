{ callPackage
, support
}:   (callPackage ./core.nix { })
  ++ (callPackage ./lsps.nix { inherit support; })
