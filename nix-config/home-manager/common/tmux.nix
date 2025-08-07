{ pkgs, config, ... }:
{


programs.tmux = {
    enable = true;
    escapeTime = 0;
    baseIndex = 1;
    prefix = "C-Space";
    keyMode = "vi";
    terminal = "screen-256color"; # Also applies to xterm-256color due to terminal-features override



extraConfig = ''
  set-option -sa terminal-features ',xterm-256color:RGB'
  set-option -a terminal-features 'screen-256color:RGB'

  set-option -g allow-passthrough on
  bind-key C-Space send-prefix

  set -g renumber-windows on
  set-window-option -g mode-keys vi

  # Status bar styles
  set -g status-position top
  set -g status-justify absolute-centre
  set -g status-style "fg=color7 bg=default"
  set -g status-right ""
  set -g status-left "#S"
  set -g status-left-style "fg=color8"
  set -g status-right-length 0
  set -g status-left-length 100

  setw -g window-status-current-style "fg=colour6 bg=default bold"
  setw -g window-status-current-format "#I:#W "
  setw -g window-status-style "fg=color8"

  # Vim-like pane switching
  bind -r ^ last-window
  bind -r k select-pane -U
  bind -r j select-pane -D
  bind -r h select-pane -L
  bind -r l select-pane -R

  # Pane splitting in current path
  bind v split-window -v -c "#{pane_current_path}"
  bind h split-window -h -c "#{pane_current_path}"

  # Toggle status bar
  bind-key b set-option status
'';



  };



}
