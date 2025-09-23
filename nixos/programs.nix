{inputs, pkgs, ...}: {
  # NixOS
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    vim
    htop
    rsync
    python313
    wget
    wireguard-tools

    # Home manager
    inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.home-manager
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

  # Docker
  virtualisation.docker.enable = true;
}
