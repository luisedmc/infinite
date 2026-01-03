{
  inputs,
  pkgs,
  ...
}:
{
  programs.anyrun = {
    enable = true;
    config = {

      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
      ];

      x.fraction = 0.5;
      y.fraction = 0.2;

      width.absolute = 400;

      layer = "overlay";

      hideIcons = false;
      hidePluginInfo = true;
      closeOnClick = false;
      showResultsImmediately = true;
      maxEntries = 5;
    };

    extraConfigFiles = {
      "uwsm_app.ron".text = ''
        Config(
          desktop_actions: false,
          max_entries: 5,
        )
      '';

      "shell.ron".text = ''
        Config(
          prefix: ">"
        )
      '';
    };

    extraCss = ''
      		/*
            window {
              background: transparent;
            }
      			*/

            box.main {
              padding: 5px;
              margin: 10px;
              border-radius: 10px;
              border: 2px solid rgba(255, 255, 255, 0.15); /* neutral border */
              background-color: @theme_bg_color;
            }

            text {
              font-size: 18px;
              min-height: 30px;
              padding: 5px;
              border-radius: 8px;
              box-shadow: none;
              border: none; /* removes blue focus/search border */
            }

            .matches {
              background-color: rgba(0, 0, 0, 0);
            }

            list.plugin {
              background-color: rgba(0, 0, 0, 0);
            }

            list.plugin row {
              margin-bottom: 4px;
              margin-left: 12px;
              background: transparent;
              border-radius: 8px;
            }

            list.plugin row:selected {
              border-left: 2px solid rgba(255, 255, 255, 0.35); /* monochrome highlight */
              margin-left: 4px;
              padding-left: 6px;
              background: @theme_bg_color;
              border-radius: 8px;
            }

            label.match.title {
              font-size: 18px;
            }

            label.match.description {
              font-size: 12px;
            }
    '';
  };
}
