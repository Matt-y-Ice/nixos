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
  ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the package manager and list system-level packages.
  environment.systemPackages = with pkgs; [
    vim
    wireguard-tools
    curl
    wget
    tree
    flatpak
    ptyxis
    podman
    podman-desktop
    podman-compose
    docker
    docker-compose
    # Virtualization packages
    qemu
    libvirt
    virt-manager
    swtpm
    OVMF
    dnsmasq
    bridge-utils
    usbutils
    spice
    cudatoolkit
  ];

  # Enable Flatpak
  services.flatpak.enable = true;

  # Enable Lorri
  services.lorri.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?

  virtualisation.docker.enable = true;
  systemd.services.docker = { enable = true; };

}
