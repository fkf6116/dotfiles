{ pkgs, config, ... }:
{


programs.tmux = {
    enable = true;
    escapeTime = 0;
    baseIndex = 1;
    prefix = "C-Space";
    keyMode = "vi";
extraConfig = ''
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",xterm-256color:Tc"

  set -g renumber-windows on
  set -g status-position top
  set -g status-justify absolute-centre
  set -g status-style "fg=color7 bg=default"
  set -g status-right ""
  set -g status-left "#S"
  set -g status-left-style "fg=color8"
  set -g status-right-length 0
  set -g status-left-length 100
  setw -g window-status-current-format "#I:#W "
  setw -g window-status-style "fg=color8"
  bind -r ^ last-window
  bind -r k select-pane -U
  bind -r j select-pane -D
  bind -r h select-pane -L
  bind -r l select-pane -R
  bind v split-window -v -c "#{pane_current_path}"
  bind h split-window -h -c "#{pane_current_path}"
  # Toggle status bar
  bind-key b set-option status
'';



  };



}
