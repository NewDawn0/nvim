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
      presets = import ./nix/presets.nix;
      builder = pkgs.callPackage ./nix/builder.nix { };
      nvim = pkgs.lib.makeOverridable builder presets.default;
    in {
      inherit nvim;
      default = nvim;
    });
  };
}
