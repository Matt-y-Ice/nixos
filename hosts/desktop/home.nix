{ pkgs, ... }:

{
  home.username = "mattyice";
  home.homeDirectory = "/home/mattyice";
  home.stateVersion = "24.11"; 
  
  home.packages = with pkgs; [
    emacs
    fd
    ripgrep
    unzip
    gnutls
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    pandoc
    shellcheck
    nodejs
    nixfmt-classic
    shfmt
    starship
    tmux
    protonmail-desktop
    vesktop
    proton-pass
    deja-dup
    gnome-tweaks
    gnomeExtensions.user-themes
    graphite-gtk-theme
    orchis-theme
    materia-theme
    fastfetch
    brave
    vscode
    nil
    code-cursor
  ];

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-toolsai.jupyter
      ms-azuretools.vscode-docker
      ms-vscode-remote.vscode-remote-extensionpack
      ocamllabs.ocaml-platform
    ];
  };

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "vim";
    PATH = "$HOME/.nix-profile/bin:$PATH";
  };  

  home.file.".bashrc".text = builtins.readFile "${builtins.path { path = ./dotfiles/bashrc; }}";
  home.file.".vimrc".text = builtins.readFile "${builtins.path { path = ./dotfiles/vimrc; }}";
}
