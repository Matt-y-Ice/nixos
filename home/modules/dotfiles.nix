{ inputs, ... }:

{
  home.file.".vimrc".source = builtins.path {
    path = "${inputs.self}/home/dotfiles/vimrc";
  };

  xdg.configFile."containers/policy.json".source = builtins.path {
    path = "${inputs.self}/home/dotfiles/policy.json";
  };
}