{
  pkgs,
  lib,
  ...
}:
{

programs.starship = {
  enable = true;
  settings = lib.mkForce {}; # disable inline config
};
home.file.".config/starship.toml".source = ./starship_jetpack.toml;

  home.packages = with pkgs; [
    pkgs.fishPlugins.autopair
    fishPlugins.fzf-fish

    # fishPlugins.tide
  ];
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    # tmux.enableShellIntegration = true;
  };
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "fruity-fkf";
    userEmail = "fruity.fkf@proton.me";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.nushell = {
    enable = true;
    extraConfig = ''
      let carapace_completer = {|spans|
      carapace $spans.0 nushell $spans | from json
      }
      $env.config = {
       show_banner: false,
      }
      $env.PATH = ($env.PATH |
      split row (char esep) |
      prepend /home/myuser/.apps |
      append /usr/bin/env
      )
    '';
    shellAliases = {
      vi = "hx";
      # vim = "hx";
      # nvim = "hx";
      ga = "git add";
      gcm = "git commit -m";
      gp = "git push";
      nano = "hx";
      gaa = "git add .";
      ".." = "cd ..";

      "..." = "cd ../..";
      "...." = "cd ../../../";
      "....." = "cd ../../../../";

      "dot" = "cd ~/.dotfiles";
      "conf" = "cd ~/.config";

      "cp" = "cp -v";
      "ddf" = "df -h";
      "etc" = "erd -H";
      "mv" = "mv -v";
      "rm" = "rm -v";
      "rr" = "rm -rf";

      "ld" = "eza -ld */ --no-quotes --time-style default --icons";
      "lla" = "eza -lah --no-quotes --time-style default --icons";
      "ll" = "eza -lh --no-quotes --time-style default --icons";
      "llr" = "eza -lhr --no-quotes --time-style default --icons";
      "lls" = "eza -lh -s size --no-quotes --time-style default --icons";
      "llt" = "eza -lh -s time --no-quotes --time-style default --icons";
      "lltr" = "eza -lhr -s time --no-quotes --time-style default --icons";

      "zj" = "zellij";
      "zja" = "zellij attach";
      "tm" = "tmux";
      "tma" = "tmux attach";

      "avi" = "vlc *.avi";
      "jpeg" = "feh -Z *.jpeg";
      "jpg" = "feh -Z *.jpg";
      "mkv" = "vlc *.mkv";
      "mov" = "vlc *.mov";
      "mp3" = "vlc *.mp3";
      "mp4" = "vlc *.mp4";
      "png" = "feh -Z *.png";
      "vvlc" = "vlc *";
      "webm" = "vlc *.webm";
    };
  };

  programs.carapace.enable = true;
  programs.carapace.enableFishIntegration = true;
  programs.carapace.enableZshIntegration = true;

  programs.helix = {
    enable = true;
    settings = {
      editor = {
        end-of-line-diagnostics = "hint";
        line-number = "relative";
        auto-format = true;
        path-completion = true;

        inline-diagnostics = {
          cursor-line = "warning";
        };

        indent-guides = {
          character = "▏";
          render = true;
        };

        lsp = {
          auto-signature-help = false;
          display-messages = true;
        };

        statusline = {
          left = [
            "mode"
            "spinner"
            "version-control"
          ];
          center = [
            "file-name"
          ];
          right = ["position" "file-type"];

        };

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };

    extraConfig = ''[keys.insert]
j = { k = "normal_mode" } # Maps `jk` to exit insert mode"
'';
  };


  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      pane_frames = true;
      tab_bar = true;
      default_layout = "compact";
      # theme = "rose-pine";
    };
  };
}
