{ pkgs, config, ... }:
{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    # aggressiveResize = true; -- Disabled to be iTerm-friendly
    baseIndex = 1;
    newSession = true;
    # Stop tmux+escape craziness.
    escapeTime = 0;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    secureSocket = false;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.rose-pine
      tmuxPlugins.vim-tmux-navigator

    ];

    extraConfig = ''
      # Mouse works as expected
      set-option -g mouse on
      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      bind-key h select-pane -L 
      bind-key j select-pane -D 
      bind-key k select-pane -U 
      bind-key l select-pane -R 
      set-option -g status-position bottom

    '';
  };

  programs.tmate = {
    enable = true;
    # FIXME: This causes tmate to hang.
    # extraConfig = config.xdg.configFile."tmux/tmux.conf".text;
  };

}
