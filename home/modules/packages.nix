{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Dev tools
    fd ripgrep unzip gnutls pandoc shellcheck nixfmt-classic shfmt
    emacs emacsPackages.vterm nil nodejs python312 direnv lorri cmake gcc gdb

    # Media tools
    mpv ffmpeg libva vaapiVdpau vdpauinfo vlc

    # Fonts
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack

    # GUI apps
    protonmail-desktop vesktop brave vivaldi libreoffice
    code-cursor apostrophe chromium gimp

    # GNOME customization
    gnome-tweaks
    gnomeExtensions.user-themes
    gnomeExtensions.proton-bridge-button
    graphite-gtk-theme orchis-theme materia-theme

    # OCaml dev
    ocaml dune_3 opam

    # Haskell dev
    ghc cabal-install haskellPackages.lsp

    # Scheme dev
    mitscheme

    # Terminal tools
    fastfetch bat lsd tmux ptyxis yazi

    # Misc tools
    deja-dup isync mu
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

  # Git Config
  programs.git = {
    enable = true;
    userName = "Matty Ice";
    userEmail = "matty_ice_2011@pm.me";
  };
}
