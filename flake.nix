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
      nvim-bld = pkgs.callPackage ./nix/nvim { };
      presets = pkgs.callPackage ./nix/presets { };
      nvim = nvim-bld.fromPreset presets.default;
    in {
      inherit nvim;
      default = nvim;
    });
  };
}
