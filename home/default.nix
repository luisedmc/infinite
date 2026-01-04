{
  inputs,
  pkgs,
  system,
  ...
}:
{
  imports = [
    ./development
    ./terminal
    ./softwares
  ];

  home = {
    username = "marin";
    homeDirectory = "/home/marin";
    stateVersion = "24.11";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Fluent-Dark";
      package = pkgs.fluent-gtk-theme.override {
        tweaks = [ "blur" ];
      };
    };
    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    cava
    gcc
    killall
    material-symbols
    playerctl
    unzip
    zip

    # development
    go

    # gui
    dbeaver-bin
    discord
    gapless
    insomnia
    mission-center
    mpv
    notesnook
    obs-studio
    pwvucontrol
    qbittorrent
    spotify

    gvfs
    xfce.tumbler
    xfce.thunar
    xfconf
    xdg-utils

    # editors
    mars-mips
    lite-xl
    vscode

    # wayland
    grim
    hypridle
    hyprpicker
    hyprpaper
    hyprshade
    hyprshot
    slurp
    waybar
    waypaper
    wl-clipboard
    wofi
  ];
}
