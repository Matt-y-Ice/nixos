{ ... }:

{
  imports = [
    ./modules/user.nix
    ./modules/shell.nix
    ./modules/packages.nix
    ./modules/dotfiles.nix
  ];
}
