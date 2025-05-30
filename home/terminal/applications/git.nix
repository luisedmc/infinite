{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    extraConfig = {
      init.defaultBranch = "master";
      core.editor = "nvim";
    };

    aliases = {
      s = "status";
    };
  };
}
