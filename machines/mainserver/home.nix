# This file is generated from "README.org"
{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    trash-cli
    unstable.fd
    gitAndTools.diff-so-fancy
    ripgrep
    unstable.fzf
    binutils
    killall
    neofetch
    unstable.mosh
    nix-index
    niv
    scrot
    feh
    lightlocker
    circleci-cli
    # nixpkgs
    nix-prefetch-git
    nix-prefetch-github
    # tui apps
    htop
    # dependencies
    libnotify
    unstable.youtube-dl
    unstable.neovim-remote
    unstable.direnv
    unstable.imagemagick
    # misc
    file
    catimg
    # joke command
    cowsay
    cmatrix
    espeak
    figlet
    fortune
    asciiquarium
  ];
  services.lorri.enable = true;

  # programs {{{
  programs = {

    home-manager.enable = true;

    neovim = (import ../../modules/editors/neovim-stable.nix) { inherit pkgs; }; # don't compile
  };
  #}}}

  # home files{{{
  home.file = {

    # tmux theme
    ".palenight-tmux".source = ../../.palenight-tmux;

    # neovim dashboard logo
    "Pictures/neovimlogo.png".source = (pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-flat.png";
      sha256 = "1vl7mi87wisqhd9zigg24y2ksjyyjk6225bvw9qk4s6gfv62w4jm";
    });

    ".ghc/ghci.conf".text = ''
      :set prompt "%s λ: "
    '';

  };
  #}}}

  # .config files{{{
  xdg.configFile = {

    "nvim/coc-settings.json".source = ../../configs/coc-settings.json;
    "neofetch/config.conf".source = ../../configs/neofetch.conf;
    "ncpamixer.conf".source = ../../configs/ncpamixer.conf;

    # nixpkgs{{{
    "nixpkgs/config.nix".text = ''
      { allowUnfree = true; }
    '';
    # }}}

    "vifm/vifmrc".source = ../../configs/vifmrc.vim;

  };
  # }}}

  xsession.enable = false;


  # Home Manager config{{{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "hac";
  home.homeDirectory = "/home/hac";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";

  #}}}

  # local env variables{{{
  home.sessionVariables = {
    "XDG_CONFIG_HOME" = "$HOME/.config";
    "MANPAGER" = "sh -c 'col -bx | bat -l man -p'";
    "COLORTERM" = "truecolor";
  }; # }}}

}
