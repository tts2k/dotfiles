if status is-interactive
  # Commands to run in interactive sessions can go here
  starship init fish | source
  source ~/.config/fish/conf.d/kanagawa.fish
  set -g fish_greeting ""
end
