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

  programs.starship.enable = true;

  programs.fish = {
    enable = true;
    shellInit = ''
      # This is a workaround for fish not sourcing the starship init script
      # correctly when using home-manager.
      set -gx STARSHIP_CONFIG ~/.config/starship.toml
      set -gx STARSHIP_SHELL fish
      set -gx STARSHIP_SHELL_PATH $PATH
      '';
  };

  programs.direnv = {
    enable = true;
  };
}

