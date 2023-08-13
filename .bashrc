source /usr/share/fzf/completion.bash
source /usr/share/git/completion/git-prompt.sh
source /usr/share/nvm/init-nvm.sh

export PS1="\[$(tput setaf 5)\]\w\]\[$(tput setaf 3)\]\[\$(__git_ps1 \" [%s]\")\]\[$(tput setaf 2)\] \$ \[$(tput sgr0)\]"
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
source /usr/share/git/completion/git-prompt.sh
source /usr/share/nvm/init-nvm.sh

export EDITOR=nvim
export BROWSER=firefox
export FZF_DEFAULT_COMMAND='fd --type f'
export MOZ_USE_OMTC=1
export PATH=$PATH:~/.local/bin:~/go/bin/:~/.cabal/bin/:~/.nimble/bin
export HISTFILESIZE=50000

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

HISTFILESIZE=50000
=======
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export TERM=xterm-kitty

eval "$(thefuck --alias)"

alias ls='ls -h --color=auto --group-directories-first -X -F'
alias cd_='cd `cat ~/.last_dir`'
alias svd="pwd > /home/noire/.last_dir"
alias ssv="sudo systemctl"
alias sv="systemctl"
alias sus="systemctl suspend"

mkcd() 

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
