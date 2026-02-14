{ inputs, pkgs, ... }:
{
  imports = [
    ../shared
    inputs.home-manager.nixosModules.home-manager
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
  };

  environment.systemPackages = [
    inputs.rose-pine-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.marin = import ../../home/hyprland;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
  };
}
