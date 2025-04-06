{ pkgs, ... }:

{
  users.users.mattyice = {
    isNormalUser = true;
    description = "matty ice";
    extraGroups =
      [ "networkmanager" "wheel" "docker" "libvirt" "video" "audio" "input" ];
  };

}
