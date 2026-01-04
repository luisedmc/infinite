{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [
        "/home/marin/Pictures/nix-binary.png"
      ];
      wallpaper = [
        "DP-1, /home/marin/Pictures/nix-binary.png"
      ];
    };
  };
}
