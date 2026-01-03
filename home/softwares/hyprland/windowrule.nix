{ ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "workspace 6 silent,class:^(org.qbittorrent.qBittorrent)$"
        "workspace 5 silent,class:^(discord)$"

        "workspace 4 silent,class:^(IVPN)$"
        "move 1590 439,class:^(IVPN)$"

        "workspace 4 silent,class:^(Spotify)$"
        "float,class:^(Spotify)$"

        "opacity 0.0 override, class:^(xwaylandvideobridge)$"
        "noanim, class:^(xwaylandvideobridge)$"
        "noinitialfocus, class:^(xwaylandvideobridge)$"
        "maxsize 1 1, class:^(xwaylandvideobridge)$"
        "noblur, class:^(xwaylandvideobridge)$"
      ];
    };
  };
}
