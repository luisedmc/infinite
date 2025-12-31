{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Luis Eduardo M.";
        email = "luiseduardomc019@gmail.com";
      };

      extraConfig = {
        init.defaultBranch = "master";
        core.editor = "nvim";
      };
    };
  };
}
