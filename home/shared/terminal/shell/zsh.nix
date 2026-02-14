{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    shellAliases = {
      hypr = "start-hyprland";
      rebuild = "sudo nixos-rebuild switch --flake ~/infinite#infinite --override-input ags-config path:/home/marin/ags";
      rebuild-celeste = "sudo nixos-rebuild switch --flake ~/infinite#celeste --override-input ags-config path:/home/marin/ags";
      rebuild-plasma = "sudo nixos-rebuild switch --flake ~/infinite#plasma --override-input ags-config path:/home/marin/ags";
      clean = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      ".." = "cd ..";

      # nodejs
      usenode25 = "nix develop /home/marin/infinite#node-25";
      usenode22 = "nix develop /home/marin/infinite#node-22";
      usenode20 = "nix develop /home/marin/infinite#node-20";

      ls = "eza --icons --group-directories-first";
      ll = "eza --icons -lh --group-directories-first --no-user --long";
      la = "eza --icons -lah --group-directories-first";
      tree = "eza --icons --tree --group-directories-first";
    };

    initContent = ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
    '';
  };
}
