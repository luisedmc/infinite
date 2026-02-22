{
  inputs,
  pkgs,
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
  systemd.user.startServices = "sd-switch";

  home.packages = with pkgs; [
    cava
    fd
    fzf
    gcc
    headsetcontrol
    killall
    material-symbols
    playerctl
    unzip
    usbutils
    zip

    # development
    go
    laravel
    lua
    python3
    rustc
    typescript

    # gui
    bitwarden-desktop
    dbeaver-bin
    discord
    foliate
    gapless
    insomnia
    mission-center
    mpv
    notesnook
    obs-studio
    pavucontrol
    qbittorrent
    spotify
		ungoogled-chromium

    tumbler
    thunar
    xfconf
    xdg-utils

    # editors
    emacs
    lite-xl
    mars-mips
  ];
}
