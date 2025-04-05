{ inputs, ... }:

let
  dotfiles = "${inputs.self}/home/dotfiles";
in {
  home.file.".vimrc".text = builtins.readFile "${dotfiles}/vimrc";

  xdg.configFile."containers/policy.json".text = builtins.readFile "${dotfiles}/policy.json";
}
