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
    prompt.init = ''
      starship init fish | source
    '';
    shellAliases = {
      ls = "lsd";
      cat = "bat";
      ll = "ls -l";
      gs = "git status";
    };
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };
}

