{ pkgs, ... }:

{
  services.awww = {
    enable = true;
    package = pkgs.awww;
  };

  xdg.configFile."waypaper/config.ini".text = ''
    [Settings]
    language = en
    folder = /home/marin/Pictures
    wallpaper = /home/marin/Pictures/nixos-binary.png
    backend = awww
    monitors = All
    fill = fill
    sort = name
    color = #070707
    subfolders = False
    number_of_columns = 3
    awww_transition_type = fade
    awww_transition_step = 90
    awww_transition_duration = 3
  '';
}
