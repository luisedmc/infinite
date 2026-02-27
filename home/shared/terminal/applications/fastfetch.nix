{
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        separator = " ";
      };
      logo = {
        # padding = {
        #   right = 6;
        # };
        # source = "~/Pictures/nixos-logo.png";
        width = 16;
        height = 16;
      };
      modules = [
        "break"
        "break"
        "break"
        {
          key = " ";
          keyColor = "#A58AF6";
          type = "os";
        }
        {
          key = " ";
          # keyColor = "cyan";
          # keyColor = "#6E6EFF";
          keyColor = "#A58AF6";
          type = "kernel";
        }
        {
          key = " ";
          # keyColor = "cyan";
          # keyColor = "#6E6EFF";
          keyColor = "#A58AF6";
          type = "packages";
        }
        {
          key = " ";
          # keyColor = "cyan";
          # keyColor = "#6E6EFF";
          keyColor = "#A58AF6";
          type = "shell";
        }
        {
          key = " ";
          # keyColor = "cyan";
          # keyColor = "#6E6EFF";
          keyColor = "#A58AF6";
          type = "terminal";
        }
        {
          key = " ";
          # keyColor = "cyan";
          # keyColor = "#6E6EFF";
          keyColor = "#A58AF6";
          type = "wm";
        }
        {
          key = " ";
          # keyColor = "cyan";
          # keyColor = "#6E6EFF";
          keyColor = "#A58AF6";
          type = "uptime";
        }
        {
          key = "󰝚 ";
          # keyColor = "cyan";
          # keyColor = "#6E6EFF";
          keyColor = "#A58AF6";
          type = "media";
        }
        "break"
        "break"
      ];
    };
  };
}
