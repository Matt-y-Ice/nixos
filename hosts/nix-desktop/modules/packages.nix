{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # terminal tools
    vim
    curl
    wget
    tree
    ptyxis
    wireguard-tools

    # container software
    podman
    podman-desktop
    podman-compose
    docker
    docker-compose

    # virtualization software
    qemu
    libvirt
    virt-manager
    swtpm
    OVMF
    dnsmasq
    bridge-utils
    usbutils
    spice

    # cuda
    cudatoolkit
  ];

  services.flatpak.enable = true;
  services.lorri.enable = true;
}
