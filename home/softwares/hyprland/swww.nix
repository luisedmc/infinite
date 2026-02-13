{ pkgs, ... }:

{
  # Enable swww daemon via home-manager
  services.swww = {
    enable = true;
    package = pkgs.swww;
  };

  # Configure waypaper to use swww backend
  xdg.configFile."waypaper/config.ini".text = ''
    [Settings]
    language = en
    folder = /home/marin/Pictures
    wallpaper = /home/marin/Pictures/nixos-binary.png
    backend = swww
    monitors = All
    fill = fill
    sort = name
    color = #070707
    subfolders = False
    number_of_columns = 3
    swww_transition_type = fade
    swww_transition_step = 90
    swww_transition_duration = 3
  '';
}
