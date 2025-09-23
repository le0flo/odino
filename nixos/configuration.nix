{ inputs, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./ssh.nix
    ./programs.nix

    inputs.home-manager.nixosModules.home-manager
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

  # Version
  system.stateVersion = "25.05";
}
