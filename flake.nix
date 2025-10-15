{
  description = "Nvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.05";
    utils = {
      url = "github:NewDawn0/nixUtils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, utils, ... }: {
    overlays.default = final: prev: {
      nvim = self.packages.${prev.system}.default;
    };
    packages = utils.lib.eachSystem { } (pkgs: let
      nvim = pkgs.callPackage ./nvim.nix { };
    in {
      inherit nvim;
      default = nvim;
    });
  };
}
