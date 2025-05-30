{ ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
				"workspace 5 silent,class:^(org.qbittorrent.qBittorrent)$"
				"workspace 6 silent,class:^(discord)$"

				"workspace 4 silent,class:^(IVPN)$"
				"move 1590 439,class:^(IVPN)$"

				"workspace 4 silent,class:^(Spotify)$"
				"float,class:^(Spotify)$"
				"size 1550 950,class:^(Spotify)$"
				"move 20 90,class:^(Spotify)$"

				"opacity 0.0 override, class:^(xwaylandvideobridge)$"
				"noanim, class:^(xwaylandvideobridge)$"
				"noinitialfocus, class:^(xwaylandvideobridge)$"
				"maxsize 1 1, class:^(xwaylandvideobridge)$"
				"noblur, class:^(xwaylandvideobridge)$"
      ];
    };
  };
}

