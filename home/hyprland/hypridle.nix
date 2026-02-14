{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = ""; # optional (hyprlock, swaylock, etc.)
        before_sleep_cmd = "hyprctl dispatch dpms off";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 600; # 10 minutes
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
