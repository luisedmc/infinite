{ ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrains Mono Nerd Font:size=11";
        prompt = "";
        icons-enabled = true;
        width = 35;
        lines = 10;
        horizontal-pad = 20;
        vertical-pad = 12;
        inner-pad = 8;
      };
      colors = {
        background = "070707ee";
        text = "dfdfdfff";
        selection = "1a1a1aff";
        selection-text = "ffffffff";
        border = "070707ff";
        match = "0DD4E5ff";
      };
      border = {
        width = 2;
        radius = 10;
      };
    };
  };
}
