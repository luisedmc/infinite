{ inputs, pkgs, ... }:
{
  imports = [
    ../shared
    inputs.home-manager.nixosModules.home-manager
  ];

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.marin = import ../../home/plasma;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    overwriteBackup = true;
  };
}
