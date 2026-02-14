{
  inputs,
  pkgs,
  system,
  ...
}:
{
  imports = [
    ./fastfetch.nix
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    btop
    eza
    fastfetch
    feh
    ffmpegthumbnailer
    imagemagick
    liquidctl
    lm_sensors
    macchina
    ncdu
    pamixer
    yazi
  ];
}
