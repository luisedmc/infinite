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
    networkmanager.enable = true;
  };

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    openssh.enable = true;
    upower.enable = true;

    gvfs.enable = true;

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

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_18;

    ensureDatabases = [ "marin" ];

    settings = {
      timezone = "America/Sao_Paulo";
    };

    ensureUsers = [
      {
        name = "marin";
        ensureDBOwnership = true;
        ensureClauses.superuser = true;
      }
    ];
  };

  services.geoclue2 = {
    enable = true;
    appConfig = {
      "chromium-browser" = {
        isAllowed = true;
        isSystem = false;
      };
      "zen" = {
        isAllowed = true;
        isSystem = false;
      };
    };
  };

  xdg.portal.enable = true;

  location.provider = "geoclue2";

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

  programs = {
    coolercontrol.enable = true;
    steam.enable = true;
    zsh.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    kitty
    neovim
    ntfs3g

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
