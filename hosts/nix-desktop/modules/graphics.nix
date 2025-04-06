{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.VideoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
  };

}
