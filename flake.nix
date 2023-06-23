{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs = {
    self,
    nixpkgs,
    neovim
  }: let
    system = "x86_64-linux";
    
    # Overlay lets you override input pkgs or define new ones
    # prev (attset argument) - original nixpkgs
    # final - new package set
    overlayFlakeInputs = prev: final: {
      neovim = neovim.packages.${system}.neovim;
    };
    overlayNeovim = prev: final: {
      myNeovim = import ./myNeovim.nix {
        pkgs = final;
      };
    };
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ overlayFlakeInputs overlayNeovim ];
  };
  in {
    packages.${system}.default = pkgs.neovim;
    apps.${system}.default = {
      type = "app";
      program = "${pkgs.myNeovim}/bin/nvim";
    };
  };
}
