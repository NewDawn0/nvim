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
    overlays.default = final: prev: let
      outs = self.packages.${prev.system};
    in {
      nvim = outs.nvim;
      nvim-full = outs.nvim-full;
    };
    packages = utils.lib.eachSystem {
      overlays = with inputs; [
        (import ./nix/overlays.nix)
        pmm-nvim.overlays.default
      ];
    } (pkgs: let
      nvim = pkgs.callPackage ./nix { };
      nvim-full = nvim.withPresets (p: [ p.full ]);
    in {
      inherit nvim nvim-full;
      default = nvim;
    });
  };
}
