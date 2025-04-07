{ pkgs, ... }:

{
  networking.hostName = "nix-desktop";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 443 ];
    allowedUDPPorts = [ 53 ];
  };
  networking.wg-quick.interfaces = {
    w0 = {
      configFile = "/etc/wireguard/w0.conf";
      autostart = true;
    };
  };
}
