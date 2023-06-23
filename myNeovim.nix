{ 
  pkgs 
}: let
  luaRC = import ./config { inherit pkgs; };
  plugins = import ./plugins.nix { inherit pkgs; };
in pkgs.wrapNeovim pkgs.neovim {
  configure = {
    inherit luaRC;
    packages.all.start = plugins;
  };
}
