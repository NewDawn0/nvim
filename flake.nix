{
  description = "Nvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.05";
    utils = {
      url = "github:NewDawn0/nixUtils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pmm-nvim = {
      url = "path:/home/dawn/GitHub/shitbox/pmm-re";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.utils.follows   = "utils";
    };
  };
  outputs = { self, utils, ... }@inputs: {
    overlays.default = final: prev: {
      nvim = self.packages.${prev.system}.default;
    };
    packages = utils.lib.eachSystem {
      overlays = with inputs; [
        (import ./nix/overlays.nix)
        pmm-nvim.overlays.default
      ];
    } (pkgs: let
      nvim-bld = pkgs.callPackage ./nix/nvim { };
      presets = import ./nix/presets.nix;
      nvim = nvim-bld.fromPreset presets.default;
    in {
      inherit nvim;
      default = nvim;
    });
  };
}
