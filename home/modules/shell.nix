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

  programs.direnv = {
    enable = true;
  };
}

