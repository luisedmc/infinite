{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "workspace 6 silent, match:class ^(org.qbittorrent.qBittorrent)$"
      "workspace 5 silent, match:class ^(discord)$"
      "workspace 4 silent, match:class ^(IVPN)$"
      "move 1590 439, match:class ^(IVPN)$"
      "workspace 4 silent, match:class ^(Spotify)$"
      "float on, match:class ^(Spotify)$"
      "opacity 0.0 override, match:class ^(xwaylandvideobridge)$"
      "no_anim on, match:class ^(xwaylandvideobridge)$"
      "no_initial_focus on, match:class ^(xwaylandvideobridge)$"
      "max_size 1 1, match:class ^(xwaylandvideobridge)$"
      "no_blur on, match:class ^(xwaylandvideobridge)$"
    ];
  };
}