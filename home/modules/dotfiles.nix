{ ... }:

let
  dotfiles = ./dotfiles;
in {
  home.file.".vimrc".text =
    builtins.readFile (builtins.path { path = "${dotfiles}/vimrc"; });

  xdg.configFile."containers/policy.json".text =
    builtins.readFile (builtins.path { path = "${dotfiles}/containers/policy.json"; });
}
