{
  inputs,
  pkgs,
  system,
  ...
}:
{
  imports = [
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
    go
    killall
    material-symbols
    playerctl
    unzip
    zip

    # gui
    discord
    gapless
    lite-xl
    mpv
    notesnook
    obs-studio
    pwvucontrol
    qbittorrent
    stremio

    xfce.tumbler
    xfce.thunar
    xfce.xfconf

    # editors
    mars-mips
    zed-editor

    # wayland
    grim
    hyprpicker
    hyprpaper
    hyprshade
    hyprshot
    slurp
    swww
    waybar
    wl-clipboard
  ];
}
