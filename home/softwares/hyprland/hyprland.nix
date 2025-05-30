{
  pkgs,
  ...
}:
let
  inherit (import ../../../hosts/infinite/variables.nix)
    keyboardLayout
    ;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    settings = {
      "$MOD" = "ALT";
      env = [
        "LIBVA DRIVER NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "XCURSOR_THEME,BreezeX-RosePine-Linux"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,rose-pine-hyprcursor"
        "HYPRCURSOR_SIZE,24"
      ];
      exec-once = [
        "waybar"
        "hyprpaper"
        "dunst"
        "spotify"
        "swww-daemon"
        "hyprshade on vibrance"
        "hyprctl setcursor rose-pine-hyprcursor 24"
      ];
      general = {
        monitor = [ "DP-1,1920x1080@240,0x0,1" ];
        gaps_in = 3;
        gaps_out = 6;

        border_size = 0;
        "col.active_border" = "0x00000000";
        "col.inactive_border" = "0x00000000";
        resize_on_border = false;

        layout = "dwindle";
      };

      decoration = {
        rounding = 6;
        active_opacity = 0.99;
        inactive_opacity = 0.95;

        #     blur = {
        #       enabled = true;
        #       size = 10;
        #       passes = 3;
        #       new_optimizations = true;
        #       ignore_opacity = true;
        #       noise = "0.1";
        #       contrast = "1.0";
        #       brightness = "1.0";
        #       xray = true;
        #       vibrancy = "0.5";
        #       vibrancy_darkness = "0.1";
        #       popups = true;
        #       popups_ignorealpha = "0.2";
        #     };
        # shadow = {
        # 	enabled = true;
        # 	ignore_window = true;
        # 	offset = "0 8";
        # 	range = 50;
        # 	render_power = 3;
        # 	color = "rgba(00000055)";
        # };
        blur = {
          enabled = true;
          xray = true;
          special = true;
          new_optimizations = true;
          popups = true;
          size = 2;
          passes = 4;
          brightness = 1;
          noise = 0.01;
          contrast = 1.0;
          vibrancy = 0.4;
          ignore_opacity = 0;
        };
        shadow = {
          enabled = true;
          ignore_window = false;
          range = 7;
          offset = "0 2";
          render_power = 2;
          color = "rgba(000000CC)";
        };
      };

      animations = {
        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];
        animation = [
          "windowsIn, 1, 1.7, easeOutCubic, slide"
          "windowsOut, 1, 1.7, easeOutCubic, slide"
          "windowsMove, 1, 2.5, easeinoutsine, slide"
          "fadeIn, 1, 3, easeOutCubic"
          "fadeOut, 1, 3, easeOutCubic"
          "fadeSwitch, 1, 5, easeOutCirc"
          "fadeShadow, 1, 5, easeOutCirc"
          "fadeDim, 1, 6, fluent_decel"
          "border, 1, 2.7, easeOutCirc"
          "workspaces, 1, 2, fluent_decel, slide"
          "specialWorkspace, 1, 3, fluent_decel, slidevert"
        ];
      };

      dwindle = {
        pseudotile = false;
        preserve_split = true;
      };

      misc = {
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "${keyboardLayout}";
        follow_mouse = 1;
        sensitivity = -0.6;
      };

      gestures = {
        workspace_swipe = true;
      };

      cursor = {
        no_hardware_cursors = true;
        enable_hyprcursor = true;
      };
    };
  };
}
