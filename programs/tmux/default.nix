{
  config,
  pkgs,
  libs,
  ...
}: {
  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      terminal = "screen-256color";
      historyLimit = 10000;
      plugins = with pkgs.tmuxPlugins; [
        battery
        better-mouse-mode
        continuum
        jump
        pain-control
        prefix-highlight
        resurrect
        tilish
        yank
      ];
      extraConfig = ''
        unbind C-b
        set -g prefix C-Space
        set -as terminal-overrides ",*:Tc"

        bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"
        bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "xclip -in -selection clipboard"

        bind-key -n M-n new-window -c "#{pane_current_path}"
        bind-key -n M-. select-window -n
        bind-key -n M-, select-window -p
        bind-key -n M-< swap-window -t -1
        bind-key -n M-> swap-window -t +1
        bind-key -n M-X confirm-before "kill-window"
        bind-key -n M-v split-window -h -c "#{pane_current_path}"
        bind-key -n M-b split-window -v -c "#{pane_current_path}"
        bind-key -n M-R command-prompt -I "" "rename-window '%%'"
        bind-key -n M-f resize-pane -Z
        bind-key -n M-h select-pane -L
        bind-key -n M-l select-pane -R
        bind-key -n M-k select-pane -U
        bind-key -n M-j select-pane -D
        bind-key -n M-x confirm-before "kill-pane"
        bind-key -n M-/ copy-mode

        set -g base-index 1
        set -g bell-action any
        set -g focus-events on
        set -g message-style fg=colour0,bg=colour3
        set -g mouse on
        set -g status-interval 1
        set -g status-justify centre
        set -g status-left ""
        set -g status-right ""
        set -g status-style fg=colour15
        set -g visual-activity on
        set -s escape-time 0

        set-option -g renumber-windows on
        set-option -g set-clipboard off
        set-option -g set-titles on
        set-option -g set-titles-string 'tmux - #W'
        set-option -g status-keys vi
        set-option -g visual-bell off

        setw -g mode-keys vi
        setw -g monitor-activity on
        setw -g window-status-bell-style fg=colour1
        setw -g window-status-current-style fg=blue,bold
        setw -g window-status-style fg=colour250
        setw -g window-status-current-format ' #{?#{==:#W,#{b:SHELL}},#{b:pane_current_path},#W} '
        setw -g window-status-format ' #{?#{==:#W,#{b:SHELL}},#{b:pane_current_path},#W} '
      '';
    };
  };
}
