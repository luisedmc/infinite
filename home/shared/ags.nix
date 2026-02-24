{ pkgs, inputs, ... }:
let
  system = "x86_64-linux";

  astalPackages = with inputs.ags.packages.${system}; [
    io
    astal4
    apps
    hyprland
    mpris
    network
    wireplumber
    tray
  ];

  extraPackages =
    astalPackages
    ++ [
      pkgs.libadwaita
      pkgs.libsoup_3
    ];

  my-shell = pkgs.stdenv.mkDerivation {
    name = "my-shell";
    src = inputs.ags-config;

    nativeBuildInputs = with pkgs; [
      wrapGAppsHook3
      gobject-introspection
      inputs.ags.packages.${system}.default
    ];

    buildInputs = extraPackages ++ [ pkgs.gjs ];

    installPhase = ''
      runHook preInstall

      mkdir -p $out/bin
      mkdir -p $out/share
      cp -r * $out/share
      ags bundle app.ts $out/bin/my-shell -d "SRC='$out/share'"
      # ags-config is a local path input and can carry non-reproducible symlinks.
      rm -rf $out/share/node_modules

      runHook postInstall
    '';
  };
in
{
  home.packages = [ my-shell ];

  systemd.user.services.ags = {
    Unit = {
      Description = "AGS shell";
      PartOf = [ "graphical-session.target" ];
      Wants = [ "pipewire.service" "pipewire-pulse.service" "wireplumber.service" ];
      After = [ "graphical-session.target" "pipewire.service" "pipewire-pulse.service" "wireplumber.service" ];
      ConditionEnvironment = "WAYLAND_DISPLAY";
      X-Restart-Triggers = [ "${my-shell}/bin/my-shell" ];
    };

    Service = {
      ExecStartPre = "-${pkgs.procps}/bin/pkill -x my-shell";
      ExecStart = "${my-shell}/bin/my-shell";
      Restart = "always";
      RestartSec = 1;
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
