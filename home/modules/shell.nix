{ ... }:

{
  home.sessionVariables = {
    PATH = "~/.config/emacs/bin:$PATH";
  };

  home.shellAliases = {
    ls = "lsd";
    cat = "bat";
    ll = "ls -l";
    gs = "git status";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
    '';
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };
}

