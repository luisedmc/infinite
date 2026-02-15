{
  programs.wofi = {
    enable = true;
    settings = {
      mode = "run";
      insensitive = true;
      prompt = "";
      hide_scroll = true;
      location = 0;
      allow_images = true;
      width = 500;
    };
    style = ''
      @define-color bar_bg #070707;
      @define-color module_bg #141414;
      @define-color module_bg_hover #1e1e1e;
      @define-color text #cdd6f4;
      @define-color text_dim #6c7086;
      @define-color accent #4f65f1;

      * {
        font-family: "JetBrains Mono Nerd Font", "JetBrainsMono Nerd Font", monospace;
        font-weight: 600;
        font-size: 13px;
      }

      window {
        background: transparent;
        border: none;
        box-shadow: none;
        margin: 0;
      }

      #outer-box {
        background: @bar_bg;
        border-radius: 16px;
        padding: 16px;
        margin: 0;
        min-width: 500px;
        min-height: 400px;
        max-height: 600px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.6);
      }

      #inner-box,
      #scroll {
        background: transparent;
        margin: 0;
      }

      #input {
        border: none;
        box-shadow: none;
        background: @module_bg;
        border-radius: 8px;
        padding: 8px 12px;
        margin: 0 0 8px 0;
        color: @text;
        caret-color: @accent;
      }

      #input:focus {
        background: @module_bg_hover;
      }

      #input placeholder {
        color: @text_dim;
      }

      #entry {
        background: transparent;
        border: none;
        box-shadow: none;
        border-radius: 8px;
        padding: 8px 10px;
        margin: 0;
      }

      #entry:hover {
        background: @module_bg_hover;
      }

      #entry:selected {
        outline: none;
        border: none;
        background: alpha(@accent, 0.15);
      }

      #img {
        margin-right: 10px;
      }

      #text {
        margin: 0;
        color: @text;
        font-size: 13px;
        font-weight: 700;
      }

      #text:selected {
        background: none;
        color: @text;
      }
    '';
  };
}
