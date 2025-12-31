{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      extraConfig = {
        init.defaultBranch = "master";
        core.editor = "nvim";
      };
    };
  };
}
