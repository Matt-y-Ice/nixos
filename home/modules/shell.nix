{ pkgs, ... }:

{
  programs.starship.enable = true;
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "lsd";
      cat = "bat";
      ll = "ls -l";
      gs = "git status";
    };
    interactiveShellInit = ''
      starship init fish | source
    '';
  };

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
    PAGER = "bat";
  };

  home.sessionPath = [
    "$HOME/.config/emacs/bin"
    "$HOME/.local/bin"
  ];

  programs.direnv = {
    enable = true;
  };
}

