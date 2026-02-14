{ pkgs, inputs, ... }:
{
  imports = [
    ../shared
    ./niri.nix
    ./dunst.nix
    ./fuzzel.nix
    ../shared/ags.nix
  ];

  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    waypaper
    swww
  ];
}
