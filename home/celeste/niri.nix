{ ... }:
{
  xdg.configFile."niri/config.kdl".text = ''
    input {
      keyboard {
        xkb {
          layout "us"
        }
      }
      mouse {
        accel-speed -0.6
      }
    }

    output "DP-1" {
      mode "1920x1080@240"
      scale 1.0
    }

    layout {
      gaps 6
      border {
        off
      }
      default-column-width {
        proportion 0.5
      }
    }

    environment {
      LIBVA_DRIVER_NAME "nvidia"
      XDG_SESSION_TYPE "wayland"
      GBM_BACKEND "nvidia-drm"
      __GLX_VENDOR_LIBRARY_NAME "nvidia"
    }

    cursor {
      theme "BreezeX-RosePine-Linux"
      size 24
    }

    spawn-at-startup {
      command "systemctl" "--user" "restart" "ags.service"
    }
    spawn-at-startup {
      command "swww-daemon"
    }
    spawn-at-startup {
      command "dunst"
    }

    binds {
      Alt+Return { spawn "kitty"; }
      Alt+Q { close-window; }
      Alt+B { spawn "zen"; }
      Alt+D { spawn "fuzzel"; }
      Alt+W { spawn "thunar"; }
      Alt+F { fullscreen-window; }
      Alt+V { toggle-window-floating; }
      Alt+E { spawn "waypaper"; }

      Alt+H { focus-column-left; }
      Alt+L { focus-column-right; }
      Alt+J { focus-window-down; }
      Alt+K { focus-window-up; }

      Alt+Shift+H { move-column-left; }
      Alt+Shift+L { move-column-right; }
      Alt+Shift+J { move-window-down; }
      Alt+Shift+K { move-window-up; }

      Alt+1 { focus-workspace 1; }
      Alt+2 { focus-workspace 2; }
      Alt+3 { focus-workspace 3; }
      Alt+4 { focus-workspace 4; }
      Alt+5 { focus-workspace 5; }
      Alt+6 { focus-workspace 6; }
      Alt+7 { focus-workspace 7; }
      Alt+8 { focus-workspace 8; }
      Alt+9 { focus-workspace 9; }

      Alt+Shift+1 { move-column-to-workspace 1; }
      Alt+Shift+2 { move-column-to-workspace 2; }
      Alt+Shift+3 { move-column-to-workspace 3; }
      Alt+Shift+4 { move-column-to-workspace 4; }
      Alt+Shift+5 { move-column-to-workspace 5; }
      Alt+Shift+6 { move-column-to-workspace 6; }
      Alt+Shift+7 { move-column-to-workspace 7; }
      Alt+Shift+8 { move-column-to-workspace 8; }
      Alt+Shift+9 { move-column-to-workspace 9; }

      XF86AudioPlay { spawn "playerctl" "play-pause"; }
      XF86AudioNext { spawn "playerctl" "next"; }
      XF86AudioPrev { spawn "playerctl" "previous"; }

      Alt+Shift+M { quit; }
    }
  '';
}
