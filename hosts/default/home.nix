{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mattyice";
  home.homeDirectory = "/home/mattyice";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
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
    nixfmt
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
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-toolsai.jupyter
      ms-azuretools.vscode-docker
      ms-vscode-remote.vscode-remote-extensionpack
      ocamllabs.ocaml-platform
    ];
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.file.".bashrc".text = ''
    export PATH="~/.config/emacs/bin/:$PATH"
    export PATH="/nix/store/ngk3fvkybrdcb20pazrkmf1wp30ab8h3-home-manager/bin:$PATH"
    eval "$(starship init bash)"
    eval "$(direnv hook bash)"
  '';

  home.file.".vimrc".text = ''
    " Disable compatibility with vi which can cause unexpected issues.
    set nocompatible

    " Enable type file detection. Vim will be able to try to detect the type of file in use.
    filetype on

    " Enable plugins and load plugin for the detected file type.
    filetype plugin on

    " Load an indent file for the detected file type.
    filetype indent on

    " Turn syntax highlighting on.
    syntax on

    " Add numbers to each line on the left-hand side.
    set number

    " Highlight cursor line underneath the cursor horizontally.
    set cursorline

    " Highlight cursor line underneath the cursor vertically.
    set cursorcolumn

    " Set shift width to 4 spaces.
    set shiftwidth=4

    " Set tab width to 4 columns.
    set tabstop=4

    " Use space characters instead of tabs.
    set expandtab

    " Do not save backup files.
    set nobackup

    " Do not let cursor scroll below or above N number of lines when scrolling.
    set scrolloff=10

    " Do not wrap lines. Allow long lines to extend as far as the line goes.
    set nowrap

    " While searching though a file incrementally highlight matching characters as you type.
    set incsearch

    " Ignore capital letters during search.
    set ignorecase

    " Override the ignorecase option if searching for capital letters.
    " This will allow you to search specifically for capital letters.
    set smartcase

    " Show partial command you type in the last line of the screen.
    set showcmd

    " Show the mode you are on the last line.
    set showmode

    " Show matching words during a search.
    set showmatch

    " Use highlighting when doing a search.
    set hlsearch

    " Set the commands to save in history default number is 20.
    set history=1000

    " Enable auto completion menu after pressing TAB.
    set wildmenu

    " Make wildmenu behave like similar to Bash completion.
    set wildmode=list:longest

    " There are certain files that we would never want to edit with Vim.
    " Wildmenu will ignore files with these extensions.
    set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

    " PLUGINS ---------------------------------------------------------------- {{{

    call plug#begin('~/.vim/plugged')

        Plug 'dense-analysis/ale'
        Plug 'preservim/nerdtree'
        Plug 'ryanoasis/vim-devicons'


    call plug#end()

    "set termguicolors
    ""let ayucolor=""mirage"
    "colorscheme ayu

    " }}}


    " MAPPINGS --------------------------------------------------------------- {{{

    " Map the F5 key to run a Python script inside Vim.
    " I map F5 to a chain of commands here.
    " :w saves the file.
    " <CR> (carriage return) is like pressing the enter key.
    " !clear runs the external clear screen command.
    " !python3 % executes the current file with Python.
    nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

    " Type jj to exit insert mode quickly.
    inoremap jj <Esc>

    " Press the space bar to type the : character in command mode.
    nnoremap <space> :

    " You can split the window in Vim by typing :split or :vsplit.
    " Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l

    " Resize split windows using arrow keys by pressing:
    " CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
    noremap <c-up> <c-w>+
    noremap <c-down> <c-w>-
    noremap <c-left> <c-w>>
    noremap <c-right> <c-w><

    " NERDTree specific mappings.
    " Map the F3 key to toggle NERDTree open and close.
    nnoremap <F3> :NERDTreeToggle<cr>

    " Have nerdtree ignore certain files and directories.
    let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

    " }}}


    " VIMSCRIPT -------------------------------------------------------------- {{{

    " This will enable code folding.
    " Use the marker method of folding.
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
    augroup END

    " If the current file type is HTML, set indentation to 2 spaces.
    autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

    " If Vim version is equal to or greater than 7.3 enable undofile.
    " This allows you to undo changes to a file even after saving it.
    if version >= 703
        set undodir=~/.vim/backup
        set undofile
        set undoreload=10000
    endif

    " You can split a window into sections by typing `:split` or `:vsplit`.
    " Display cursorline and cursorcolumn ONLY in active window.
    augroup cursor_off
        autocmd!
        autocmd WinLeave * set nocursorline nocursorcolumn
        autocmd WinEnter * set cursorline cursorcolumn
    augroup END

    " If GUI version of Vim is running set these options.
    if has('gui_running')

        " Set the background tone.
        set background=dark

        " Set the color scheme.
        colorscheme molokai

        " Set a custom font you have installed on your computer.
        " Syntax: set guifont=<font_name>\ <font_weight>\ <size>
        set guifont=Monospace\ Regular\ 12

        " Display more of the file by default.
        " Hide the toolbar.
        set guioptions-=T

        " Hide the the left-side scroll bar.
        set guioptions-=L

        " Hide the the right-side scroll bar.
        set guioptions-=r

        " Hide the the menu bar.
        set guioptions-=m

        " Hide the the bottom scroll bar.
        set guioptions-=b

        " Map the F4 key to toggle the menu, toolbar, and scroll bar.
        " <Bar> is the pipe character.
        " <CR> is the enter key.
        nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
            \set guioptions-=mTr<Bar>
            \else<Bar>
            \set guioptions+=mTr<Bar>
            \endif<CR>

    endif

    " }}}


    " STATUS LINE ------------------------------------------------------------ {{{

    " Clear status line when vimrc is reloaded.
    set statusline=

    " Status line left side.
    set statusline+=\ %F\ %M\ %Y\ %R

    " Use a divider to separate the left side from the right side.
    set statusline+=%=

    " Status line right side.
    set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

    " Show the status on the second to last line.
    set laststatus=2

    " }}}


  '';

  home.sessionVariables = {
    EDITOR = "vim";
    PATH = "$HOME/.nix-profile/bin:$PATH";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
