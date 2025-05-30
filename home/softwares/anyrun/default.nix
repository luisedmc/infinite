{
  pkgs,
  inputs,
  ...
}:
{
  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        shell
        symbols
        translate
      ];

      x.fraction = 0.5;
      y.fraction = 0.25;

      width.fraction = 0.2;

      hideIcons = false;
      hidePluginInfo = true;
      closeOnClick = false;
      showResultsImmediately = true;
      maxEntries = 8;
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
      #window {
        background-color: rgba(0, 0, 0, 0);
      }

      box#main {
        border-radius: 8px;
      	background-color:  rgba(8, 8, 8, 0.9);
      }

      entry#entry {
        min-height: 40px;
        border-radius: 20px;
        background: transparent;
        box-shadow: none;
        border: none;
      	color: #FFFFFF;
      }

      list#main {
        background-color: rgba(0, 0, 0, 0);
      }

      #plugin {
        background: transparent;
        padding-bottom: 5px;
      }

      #match {
        padding: 2.5px;
      	color: #FFFFFF;
      }

      #match:selected {
        background: transparent;
        border-right: 4px solid #A58AF6;
        border-left: 4px solid #A58AF6;
        border-radius: 4px;
        color: #A58AF6;
      }

      #match:selected label#info {
        color: #b0b0b0;
        animation: fade 0.1s linear
      }

      @keyframes fade {
        0% {
          color: transparent;
        }

        100% {
          color: #b0b0b0;
        }
      }

      #match label#info {
        color: transparent;
      }

      #match:hover {
        background: transparent;
      }

      label#match-desc {
        font-size: 10px;
        color: #b0b0b0;
      }

      label#plugin {
        font-size: 14px;
      }
    '';
  };
}
