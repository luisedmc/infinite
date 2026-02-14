{ inputs, pkgs, ... }:
{
  imports = [
    ../shared
    inputs.home-manager.nixosModules.home-manager
  ];

  programs.niri.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.marin = import ../../home/celeste;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
  };
}
