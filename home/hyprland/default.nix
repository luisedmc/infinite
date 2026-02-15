{ inputs, pkgs, ... }:
{
  imports = [
    ../shared
    ../shared/ags.nix
    ./hyprland.nix
    ./waybar/default.nix
    ./binds.nix
    ./hypridle.nix
    ./swww.nix
    ./windowrule.nix
    ./dunst.nix
    ./wofi.nix
  ];

  home.packages = with pkgs; [
    grim
    hyprpicker
    hyprshade
    hyprshot
    slurp
    wl-clipboard
    waypaper
  ];
}
