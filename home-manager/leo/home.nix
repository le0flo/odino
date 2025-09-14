{...}: {
  imports = [
    ./zsh.nix
  ];

  home = {
    username = "leo";
    homeDirectory = "/home/leo";
  };

  # Custom
  zsh.enable = true;

  # Version
  home.stateVersion = "25.05";
}

