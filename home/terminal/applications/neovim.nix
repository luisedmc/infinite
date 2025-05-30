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
      lua-language-server
      nixfmt-rfc-style
      nodejs
      pyright
      stylua
      ripgrep
      wget
    ];
  };
}
