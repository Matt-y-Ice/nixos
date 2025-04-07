{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.fish;

  home.sessionVariables = {
    PATH = "~/.config/emacs/bin:$PATH";
  };

  home.shellAliases = {
    ls = "lsd";
    cat = "bat";
    ll = "ls -l";
    gs = "git status";
  };

  programs.starship.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
    '';
  };

  programs.direnv = {
    enable = true;
  };
}

