{ inputs, config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    
    ./networking.nix
  ];

  # Boot
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  
  # Locales
  time.timeZone = "Europe/Rome";
  console.keyMap = "it";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };
  
  # Users
  users.users.leo = {
    isNormalUser = true;
    description = "Leonardo";
    shell = pkgs.zsh;

    extraGroups = [
      "wheel"
      "networkmanager"
      "nginx"
      "docker"
    ];
  };

  # NixOS
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Packages
  environment.systemPackages = with pkgs; [
    # Home manager
    inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.home-manager
    
    # Others
    vim
    htop
    rsync
    python313
    wget
    wireguard-tools
  ];

  # Zsh
  programs.zsh.enable = true;

  # Git
  programs.git = {
    enable = true;

    config = {
      init = {
        defaultBranch = "master";
      };
      core = {
        editor = "vim";
      };
    };
  };
  
  # OpenSSH
  services.openssh = {
    enable = true;

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      UsePAM = false;
      PrintMotd = false;
    };
  };

  # Docker
  virtualisation.docker.enable = true;
  
  # Version
  system.stateVersion = "25.05";
}
