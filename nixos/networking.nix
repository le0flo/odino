{pkgs, ...}: {
  networking = {
    hostName = "odino";

    interfaces."eno1" = {
      ipv4.addresses = [{
        address = "192.168.1.250";
        prefixLength = 24;
      }];
    };

    defaultGateway = {
      address = "192.168.1.1";
      interface = "eno1";
    };
    
    nameservers = [ "208.67.222.222" "208.67.220.220" ];
    networkmanager.enable = true;
    
    firewall = {
      enable = true;

      allowedTCPPorts = [ 22 ];
      allowedUDPPorts = [ 51820 ];
    };

    wireguard.interfaces."home" = {
      ips = [ "10.0.0.1/24" ];
      listenPort = 51820;
      
      privateKeyFile = "/home/leo/.wireguard/private";

      peers = [
        {
          publicKey = "99XBoIZ55yradB45bDZ94fc1IQGkNp9argWaT2otRBU=";
          allowedIPs = [ "10.0.0.2/32" ];
        }
        {
          publicKey = "cR1TRWLX8DqZtOEOR7djqlX0ewy648h8oHaZkW9JUjU=";
          allowedIPs = [ "10.0.0.3/32" ];
        }
        {
          publicKey = "bMgACe4Pp2VQ0lpMb0Q2RVw/n5KIIg20xT90eesxcEw=";
          allowedIPs = [ "10.0.0.4/32" ];
        }
      ];
    };
  };
}

