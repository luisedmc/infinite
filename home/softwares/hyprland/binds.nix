{
  ...
}:
let
  inherit (import ../../../hosts/infinite/variables.nix)
    browser
    terminal
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$MOD,Return,exec,${terminal}"
      "$MOD,Q,killactive"
      "$MOD,B,exec,${browser}"
      "$MODSHIFT,M,exit"
      "$MOD,W,exec,thunar"
      "$MOD,V,togglefloating"
      "$MOD,V,resizeactive,exact 1280 900"
      "$MOD,D,exec,wofi --show drun -a"
      "$MODSHIFT,J,togglesplit"
      "$MOD,P,exec,bash -c 'grim -g \"$(slurp -d)\" - | wl-copy'"
      "$MODSHIFT,P,exec,hyprshot -m output -m DP-1"
      "$MOD,N,exec,hyprpicker -a"
      "$MOD,F,fullscreen"
      "$MODSHIFT,B,exec,bash -c ~/.local/bin/restart-waybar.sh"

      "$MOD, l, movefocus, r"
      "$MOD, h, movefocus, l"
      "$MOD, j, movefocus, u"
      "$MOD, k, movefocus, d"

      "$MOD, mouse_down, workspace, e-1"
      "$MOD, mouse_up, workspace, e+1"

      # ",XF86AudioPlay, exec, playerctl, --player=spotify play-pause"
      # ",XF86AudioNext, exec, playerctl, --player=spotify next"
      # ",XF86AudioPrev, exec, playerctl --player=spotify previous"
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPrev, exec, playerctl previous"

      "${builtins.concatStringsSep "\n" (
        builtins.genList (
          x:
          let
            ws =
              let
                c = (x + 1) / 10;
              in
              builtins.toString (x + 1 - (c * 10));
          in
          ''
            				bind = $MOD, ${ws}, workspace, ${toString (x + 1)}
            				bind = $MODSHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}
            		''
        ) 10
      )}"

      "${builtins.concatStringsSep "\n" (
        map
          (
            { key, dir }:
            ''
              				bind = $MOD, ${key}, movefocus, ${dir}
              				bind = $MODSHIFT, ${key}, movewindow, ${dir} 
              				''
          )
          [
            {
              key = "left";
              dir = "l";
            }
            {
              key = "right";
              dir = "r";
            }
            {
              key = "up";
              dir = "u";
            }
            {
              key = "down";
              dir = "d";
            }
          ]
      )}"
    ];

    bindm = [
      "$MOD, mouse:272, movewindow"
      "$MOD, mouse:273, resizewindow"
    ];
  };
}
