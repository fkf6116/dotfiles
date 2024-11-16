{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.zsh = {
    enable = true;
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    shellAliases = {
      update = "sudo nixos-rebuild switch";
      ls = "eza -al --color=always --group-directories-first --icons";
      la = "eza -a --color=always --group-directories-first --icons";
      ll = "eza -l --color=always --group-directories-first --icons";
      lt = "eza -aT --color=always --group-directories-first --icons";

    };

    initExtra = ''
      ZSH_DISABLE_COMPFIX=true
      export EDITOR=nvim

      # SSH_AUTH_SOCK set to GPG to enable using gpgagent as the ssh agent.

      bindkey -e

      # disable sort when completing `git checkout`
      zstyle ':completion:*:git-checkout:*' sort false

      # set descriptions format to enable group support
      # NOTE: don't use escape sequences here, fzf-tab will ignore them
      zstyle ':completion:*:descriptions' format '[%d]'

      # set list-colors to enable filename colorizing
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}

      # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
      zstyle ':completion:*' menu no


      # Keybindings
      bindkey -e
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward
      bindkey '^[w' kill-region

      zle_highlight+=(paste:none)

      setopt appendhistory
      setopt sharehistory
      setopt hist_ignore_space
      setopt hist_ignore_all_dups
      setopt hist_save_no_dups
      setopt hist_ignore_dups
      setopt hist_find_no_dups
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "golang"
        "rust"
        "command-not-found"
        "python"
        "pip"
      ];
    };
    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
        file = "share/zsh-completions/zsh-completions.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }

    ];
  };
}
