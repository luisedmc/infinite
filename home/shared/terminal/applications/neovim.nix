{ pkgs, ... }:
{
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      cargo
      clang-tools
      fzf
      gopls
      intelephense
      lua-language-server
      nixfmt
      nodejs
      pyright
      stylua
      ripgrep
      wget
    ];
  };
}
