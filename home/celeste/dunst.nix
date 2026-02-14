{ pkgs, ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = 300;
        height = 300;
        origin = "top-right";
        offset = "10x10";
        scale = 0;
        notification_limit = 5;

        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;

        indicate_hidden = true;
        transparency = 0;
        separator_height = 2;
        padding = 12;
        horizontal_padding = 12;
        text_icon_padding = 0;
        frame_width = 0;
        frame_color = "#070707";
        gap_size = 6;
        separator_color = "frame";
        sort = true;

        font = "JetBrains Mono Nerd Font 10";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;

        enable_recursive_icon_lookup = true;
        icon_theme = "WhiteSur";
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 48;
        icon_path = "/usr/share/icons/gnome/16x16/status/:/usr/share/icons/gnome/16x16/devices/";

        sticky_history = true;
        history_length = 20;

        browser = "${pkgs.xdg-utils}/bin/xdg-open";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 4;
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;

        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };

      experimental = {
        per_monitor_dpi = false;
      };

      urgency_low = {
        background = "#070707";
        foreground = "#dfdfdf";
        timeout = 5;
      };

      urgency_normal = {
        background = "#070707";
        foreground = "#dfdfdf";
        timeout = 10;
      };

      urgency_critical = {
        background = "#070707";
        foreground = "#ff6699";
        frame_color = "#ff6699";
        timeout = 0;
      };
    };
  };
}
