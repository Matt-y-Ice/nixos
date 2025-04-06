{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/system.nix
    ./modules/graphics.nix
    ./modules/gnome.nix
    ./modules/audio.nix
    ./modules/users.nix
    ./modules/packages.nix
  ];
}
