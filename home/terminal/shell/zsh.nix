{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    shellAliases = {
      hypr = "Hyprland";
      rebuild = "sudo nixos-rebuild switch --flake ~/infinite#infinite";
      hmu = "nix run .#homeConfigurations.marin.activationPackage";
      clean = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      ".." = "cd ..";

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
