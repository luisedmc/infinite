{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [
        "/home/marin/Pictures/nixos.png"
      ];
      wallpaper = [
        # "DP-1,~/Pictures/wallpapers/nixos-white.png"
        "DP-1, contain:/home/marin/Pictures/nixos.png"
      ];
    };
  };
}
