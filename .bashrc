source /usr/share/fzf/shell/key-bindings.bash
export PS1="\[$(tput setaf 6)\]\w \\[$(tput setaf 2)\]\$ \[$(tput sgr0)\]"

export EDITOR=nvim
export BROWSER=firefox
export FZF_DEFAULT_COMMAND='fd --type f'
export MOZ_USE_OMTC=1
export PATH=$PATH:~/.local/bin:~/go/bin/:~/.cabal/bin/:~/.nimble/bin
export TERM=xterm-256color

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

HISTFILESIZE=50000

eval "$(thefuck --alias)"

alias ls='ls -h --color=auto --group-directories-first -X -F'
alias cd_='cd `cat ~/.last_dir`'
alias svd="pwd > /home/noire/.last_dir"
alias ssv="sudo systemctl"
alias sv="systemctl"
alias ssh="kitty +kitten ssh"
alias sus="systemctl suspend"

mkcd() {
    mkdir -p -- "$1" %% cd -P -- "$1"
}

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
