{ config, pkgs, unstable, master, lib, ... }:

let

    # Haskell packages{{{
    haskell-env = unstable.haskellPackages.ghcWithHoogle
        (
        hp: with hp; [
            xmonad
            xmonad-contrib
            xmonad-extras
            apply-refact
            haskell-language-server
            brittany
            cabal-install
            hlint
            xmobar
        ]
    );
    # }}}

    # doom emacs
    # doom-emacs = unstable.callPackage (builtins.fetchTarball {
    #     url = "https://github.com/vlaci/nix-doom-emacs/archive/develop.tar.gz";
    # }) {
    #     doomPrivateDir = ../../doom.d;
    # };

in
{

    imports = [
        # import xmonad nix expression
        ../../modules/common/xmonademacs.nix
    ];

    # Packages to install{{{
    home.packages = with pkgs; [
        trash-cli
        tree
        bc
        gitAndTools.diff-so-fancy
        unstable.ripgrep
        unstable.fd
        unstable.fzf
        killall
        neofetch
        pfetch
        nodePackages.node2nix
        cabal2nix
        nix-index
        niv
        haskell-env
        rnix-lsp
        scrot
        feh
        tty-clock
        appimage-run
        lightlocker
        circleci-cli
        fontforge
        palenight-gtk-theme
        unstable.pop-icon-theme
        unstable.hicolor-icon-theme # fallback gtk theme
        unstable.pandoc
        unstable.nitrogen
        unstable.chafa
        unstable.ueberzug
        # nixpkgs
        nixfmt
        nixpkgs-fmt
        nixpkgs-review
        nix-prefetch-git
        nix-prefetch-github
        pypi2nix
        # rust
        unstable.cargo
        # tui apps
        cava
        unstable.vifm-full
        vifmimg
        htop
        unstable.powertop
        unstable.bottom
        ncpamixer
        unstable.mps-youtube
        unstable.lazygit
        # gui apps
        master.discord
        tdesktop
        pavucontrol
        spotify
        sxiv
        unstable.pulseeffects
        # node packages
        nodePackages.gitmoji-cli
        # dependencies
        unstable.universal-ctags
        libnotify
        xsel # used by xmonad emoji prompt
        unstable.youtube-dl
        unstable.neovim-remote
        unstable.direnv
        unstable.imagemagick
        unstable.zstd
        unstable.editorconfig-core-c
        unstable.sqlite
        # misc
        glxinfo
        xclip
        file
        catimg
        steam-run
        # joke command
        cmatrix
        figlet
        fortune
        asciiquarium
    ];
    #}}}

    # services {{{
    services = {

        dunst = (import ../../modules/services/dunst.nix);
        gpg-agent = (import ../../modules/services/gpg-agent.nix);
        picom = (import ../../modules/services/picomanimations.nix) { inherit pkgs; };
        emacs = (import ../../modules/services/emacsdaemon.nix);
        keynav.enable = true;
        lorri.enable = true;

    };
    #}}}

    # programs {{{
    programs = {

        home-manager.enable = true;

        neovim = (import ../../modules/editors/neovim-stable.nix) { inherit pkgs unstable master; };
        emacs = {
            enable = true;
            package = unstable.emacsGccPgtk;
            extraPackages = (epkgs: [ epkgs.vterm ]);
        };
        alacritty = (import ../../modules/terminal/alacritty.nix);
        git = (import ../../modules/terminal/gitemacs.nix) { inherit pkgs unstable; };
        fish = (import ../../modules/terminal/fish.nix) { inherit pkgs; };
        tmux = (import ../../modules/terminal/tmux.nix) { inherit pkgs; };
        bat = (import ../../modules/terminal/bat.nix) { inherit pkgs; };
        starship = (import ../../modules/terminal/starship.nix) { inherit pkgs unstable; };
        lsd = (import ../../modules/terminal/lsd.nix);
        fzf = (import ../../modules/terminal/fzf.nix);
        firefox = (import ../../modules/gui/firefox.nix) { inherit pkgs unstable; };

        gpg.enable = true;

        mpv = (import ../../modules/gui/mpvintel.nix);
        qutebrowser = (import ../../modules/gui/qutebrowseremacs.nix);
        #firefox = (import ../../modules/gui/firefox.nix) { inherit pkgs; };
        zathura = (import ../../modules/gui/zathura.nix);
    };
    #}}}

    # Set your keyboard layout. I recommend Dvorak.
    home.keyboard = {
        layout = "us";
        variant = "dvorak";
    };
    #Scale to 1080p
    xsession.profileExtra = "xrandr --output LVDS1 --scale-from 1920x1080 --panning 1920x1080";

    # home files{{{
    home.file = {

        # xmobar{{{
        ".xmonad/xmobar.hs".source = ../../haskell/xmobarlaptop.hs;
        ".xmonad/xmobar.hs".onChange = ''
            if [[ -v DISPLAY ]] ; then
                echo "Recompiling xmobar"
                xmobar -r ~/.xmonad/xmobar.hs &
                sleep 2
                disown
                killall xmobar
                echo "Restarting"
                xmonad --restart
            fi
        ''; # }}}

        # tmux theme
        ".palenight-tmux".source = ../../.palenight-tmux;

        # neofetch ascii
        "textfiles/neofetchascii.txt".source = ../../textfiles/neofetchascii.txt;

        # neovim dashboard logo
        "Pictures/neovimlogo.png".source = (pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-flat.png";
            sha256 = "1vl7mi87wisqhd9zigg24y2ksjyyjk6225bvw9qk4s6gfv62w4jm";
        });

        # doom emacs dashboard logo
        "Pictures/doomdashboardlogo.png".source = (pkgs.fetchurl {
            url = "https://user-images.githubusercontent.com/7713/81558554-cbf53680-9385-11ea-8db6-2dc6abe0c1ae.png";
            sha256 = "1pkagclyj1vggiwx27ws7cdfzslw1yx2pbsiqs953mnyq1d4sqnj";
        });

        # doom emacs
        # ".emacs.d/init.el".text = ''
        #     (load "default.el")
        # '';
        ".doom.d/init.el".source = ../../doom.d/init.el;
        ".doom.d/config.el".source = ../../doom.d/config.el;
        ".doom.d/packages.el".source = ../../doom.d/packages.el;

        ".ghc/ghci.conf".text = ''
            :set prompt "%s 𝛌: "
        '';

    };
    #}}}

    # xsession{{{
    xsession = {
        enable = true;
        scriptPath = ".hm-xsession";
        #initExtra = ''
            #${pkgs.xorg.xkbcomp}/bin/xkbcomp /etc/.jislayoutremap.xkb $DISPLAY
        #'';
        pointerCursor = {
            package = pkgs.capitaine-cursors;
            name = "capitaine-cursors";
            size = 16;
        };

    }; #}}}

    # xresources config{{{
    xresources.properties = {
        "Xft.dpi" = 96;
    };
    # }}}

    # Home Manager config{{{
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "x230";
    home.homeDirectory = "/home/x230";

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
        "EDITOR" = "emacsclient -c";
    }; # }}}

    xdg = import ../../modules/common/xdg.nix { inherit pkgs; };

}
    # vim:ft=nix fdm=marker sw=4:
