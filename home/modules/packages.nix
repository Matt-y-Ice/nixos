{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Dev tools
    fd ripgrep unzip gnutls pandoc shellcheck nixfmt-classic shfmt
    emacs nil nodejs git python312 direnv lorri

    # Media tools
    mpv ffmpeg libva vaapiVdpau vdpauinfo vlc

    # Fonts
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack

    # GUI apps
    protonmail-desktop vesktop brave vivaldi libreoffice gimp
    code-cursor apostrophe

    # GNOME customization
    gnome-tweaks
    gnomeExtensions.user-themes
    graphite-gtk-theme orchis-theme materia-theme

    # OCaml dev
    ocaml dune_3 opam

    # Terminal tools
    starship fastfetch bat lsd tmux ptyxis

    # Misc tools
    deja-dup
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
}
