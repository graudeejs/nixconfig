{
  enable = true;

  searchEngines = {
    DEFAULT = "https://google.com/search?q={}";
  };

  keyBindings = {
    normal = {
      "yd" = "spawn mpv --ytdl-format='bestvideo[height<=?1080][vcodec!=vp9]+bestaudio/best' {url}";
      "yf" = "hint links spawn mpv --ytdl-format='bestvideo[height<=?1080][vcodec!=vp9]+bestaudio/best' --force-window yes {hint-url}";
    };
  };

  # settings{{{
  settings = {

    qt.args = [ "enable-native-gpu-memory-buffers" "enable-gpu-rasterization" "use-gl=egl" "ignore-gpu-blacklist" "num-raster-threads=4" ];
    url.start_pages = [ "https://btwiusegentoo.github.io/start.html" ];
    url.default_page = "https://btwiusegentoo.github.io/start.html";

    completion.web_history.max_items = 30;

    zoom.default = "90%";

    fonts = {
      default_family = "SFNS Display";
      web.family.fixed = "Spleen";
      completion = {
        category = "9pt Spleen";
        entry = "9pt Spleen";
      };
      contextmenu = "9pt Spleen";
      debug_console = "9pt Spleen";
      default_size = "9pt";
      downloads = "9pt Spleen";
      hints = "9pt Spleen";
      keyhint = "9pt Spleen";
      messages = {
        error = "9pt Spleen";
        info = "9pt Spleen";
        warning = "9pt Spleen";
      };
      prompts = "9pt Spleen";
      statusbar = "9pt Spleen";
      tabs.selected = "9pt Spleen";
      tabs.unselected = "9pt Spleen";
      #tabs = "9pt Spleen";
    };

    # colors{{{
    # base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
    # Base16 qutebrowser template by theova
    # Material Palenight scheme by Nate Peterson
    colors = {
      completion = {
        fg = "#959DCB";
        odd.bg = "#292D3E";
        even.bg = "#292D3E";
        category = {
          fg = "#FFCB6B";
          bg = "#292D3E";
          border.top = "#292D3E";
          border.bottom = "#292D3E";
        };
        item = {
          selected.fg = "#444267";
          selected.bg = "#FFCB6B";
          selected.border.top = "#FFCB6B";
          selected.border.bottom = "#FFCB6B";
          selected.match.fg = "#F07178";
        };
        match.fg = "#C3E88D";
        scrollbar = {
          fg = "#959DCB";
          bg = "#292D3E";
        };
      };
      contextmenu = {
        menu = {
          bg = "#292D3E";
          fg = "#959DCB";
        };
        selected = {
          bg = "#FFCB6B";
          fg = "#444267";
        };
      };
      downloads = {
        bar.bg = "#292D3E";
        start = {
          fg = "#292D3E";
          bg = "#82AAFF";
        };
        stop = {
          fg = "#292D3E";
          bg = "#89DDFF";
        };
        error.fg = "#F07178";
      };
      hints = {
        fg = "#292D3E";
        bg = "#FFCB6B";
        match.fg = "#959DCB";
      };
      keyhint = {
        fg = "#959DCB";
        suffix.fg = "#959DCB";
        bg = "#292D3E";
      };
      messages = {
        error = {
          fg = "#292D3E";
          bg = "#F07178";
          border = "#F07178";
        };
        warning = {
          fg = "#292D3E";
          bg = "#C792EA";
          border = "#C792EA";
        };
        info = {
          fg = "#959DCB";
          bg = "#292D3E";
          border = "#292D3E";
        };
      };
      prompts = {
        fg = "#959DCB";
        border = "#292D3E";
        bg = "#292D3E";
        selected.bg = "#FFCB6B";
      };
      statusbar = {
        normal = {
          fg = "#C3E88D";
          bg = "#292D3E";
        };
        insert = {
          fg = "#292D3E";
          bg = "#82AAFF";
        };
        passthrough = {
          fg = "#292D3E";
          bg = "#89DDFF";
        };
        private = {
          fg = "#292D3E";
          bg = "#676E95";
        };
        command = {
          fg = "#959DCB";
          bg = "#292D3E";
          private = {
            fg = "#959DCB";
            bg = "#292D3E";
          };
        };
        caret = {
          fg = "#292D3E";
          bg = "#C792EA";
          selection = {
            fg = "#292D3E";
            bg = "#82AAFF";
          };
        };
        progress.bg = "#82AAFF";
        url = {
          fg = "#959DCB";
          error.fg = "#F07178";
          hover.fg = "#959DCB";
          success = {
            http.fg = "#89DDFF";
            https.fg = "#C3E88D";
          };
          warn.fg = "#C792EA";
        };
      };
      tabs = {
        bar.bg = "#292D3E";
        indicator = {
          start = "#82AAFF";
          stop = "#89DDFF";
          error = "#F07178";
        };
        odd = {
          fg = "#959DCB";
          bg = "#292D3E";
        };
        even = {
          fg = "#959DCB";
          bg = "#292D3E";
        };
        pinned = {
          even = {
            bg = "#292D3E";
            fg = "#959DCB";
          };
          odd = {
            bg = "#292D3E";
            fg = "#959DCB";
          };
          selected = {
            even = {
              bg = "#292D3E";
              fg = "#959DCB";
            };
            odd = {
              bg = "#292D3E";
              fg = "#959DCB";
            };
          };
        };
        selected = {
          odd = {
            fg = "#FFFFFF";
            bg = "#959DCB";
          };
          even = {
            fg = "#FFFFFF";
            bg = "#959DCB";
          };
        };
      };
    }; # }}}
  };
  # }}}

  extraConfig = ''
    c.editor.command = ["emacsclient", "-c", "--eval", "(find-file \"{}\")", "(org-mode)"]
  '';

}
