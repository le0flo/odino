{...}: {
  services.openssh = {
    enable = true;

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      PrintMotd = false;
    };
  };
}
