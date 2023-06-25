{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    luaFile = pkgs.callPackage ./lua.nix {};
    plugins = pkgs.callPackage ./plugins.nix {};
    wrapNeovim = pkgs.callPackage ./wrapper.nix { 
      inherit luaFile plugins;
     };

  in {
    packages.${system}.default = wrapNeovim ;
  };
}
