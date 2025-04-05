{ inputs, ... }:

let
  dotfiles = "${inputs.self}/home/dotfiles";
in
{
  # This module is used to manage dotfiles in the home directory.
  # It uses the `home.file` and `xdg.configFile` options to create symlinks
  # to the dotfiles in the specified source directory.

  home.file = {
    ".vimrc".source = "${dotfiles}/vimrc";
  };

  xdg.configFile = {
    "containers/policy.json".source = "${dotfiles}/policy.json";
  };
}

