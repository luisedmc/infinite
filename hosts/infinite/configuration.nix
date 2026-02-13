{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix

    inputs.home-manager.nixosModules.home-manager
  ];

boot = {
  kernelPackages = pkgs.linuxPackages_6_18;

  loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      consoleMode = "max";
      editor = false;
    };
  };

    initrd.kernelModules = [
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
    kernelParams = [ "nvidia-drm.fbdev=1" ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };
      open = true;
      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };

    graphics.enable = true;
  };

  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
    };
  };

  time.timeZone = "Brazil/East";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    openssh.enable = true;
    upower.enable = true;
    
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };

  security.rtkit.enable = true;

  users = {
    users.marin = {
      isNormalUser = true;
      description = "hiii";
      extraGroups = [
        "adbusers"
        "audio"
        "input"
        "networkmanager"
        "video"
        "wheel"
      ];
      packages = with pkgs; [ ];
    };
    defaultUserShell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.marin = import ../../home/default.nix;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
  };

  programs = {
    coolercontrol.enable = true;
    steam.enable = true;
    zsh.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      xwayland.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    git
    kitty
    neovim
    ntfs3g

    inputs.rose-pine-hyprcursor.packages.${stdenv.hostPlatform.system}.default
    inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
  ];

  fonts.packages =
    with pkgs;
    [
      font-awesome
      noto-fonts
      noto-fonts-color-emoji
    ]
    ++ (with nerd-fonts; [
      iosevka
      jetbrains-mono
    ]);

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
      auto-optimise-store = true;

      substituters = [ "https://hyprland.cachix.org" ];
      trusted-substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 3d";
    };
    optimise.automatic = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  powerManagement = {
    cpuFreqGovernor = "performance";
  };

  system = {
    copySystemConfiguration = false;
    stateVersion = "24.11"; # Did you read the comment? no
  };
}
