{ ... }:

{
	services.hyprpaper = {
		enable = false;
		settings = {
			splash = false;
			preload = [
				"~/Pictures/flowers.jpg"
			];
			wallpaper = [
				# "DP-1,~/Pictures/wallpapers/nixos-white.png"
				"DP-1, contain:/home/marin/Pictures/flowers.jpg"
			];
		};
	};
}
