# CUSTOM CONFIG
# -------------

# Custom prompt
PROMPT="%F{240}[%f%(?.%F{green}✓.%F{red}%?%f)%F{240}]%f %F{214}%n%f@%m %B%F{blue}%~%f%b %# "

# Add personal ~/bin to path
PATH=$PATH:~/bin

# By default, software packages for the Go programming language are installed in the home dir (~/go/pkg/)
# In order to keep the home dir clean & organized, we would prefer that ~/go folder to be hidden (~/.go)
# We achieve this by overwriting the Go env variables: GOPATH & GOMODCACHE*
#	* To view the current Go environment, run 'go env'
export GOPATH="$HOME/.go"
export GOMODCACHE=$GOPATH"/pkg/mod"


# CUSTOM ALIASES
# --------------

# Default ls to color
alias ls="ls --color=auto"

# Add macOS-style open
alias open="xdg-open"

# Simplfy the brave-browser alias to brave
alias brave="brave-browser"

# Adds keyword for easier screenshots in gnome-based desktops (e.g. Ubuntu)
alias snip="gnome-screenshot -a"

# Adds keyword to auto-upgrade all outdated pip3 packages:
#	cut -d ' ' -f 1 -> using space as a delimiter, grab the first element (field) from every line of output
#	tail -n +3 -> strips the first two lines of output (column headers & dashed line
alias pip3-upgrade="pip3 list --outdated | cut -d ' ' -f 1 | tail -n +3 | xargs pip3 install --upgrade"

# Jump to dir where k9s logs are dumped
# alias k9s_logs='cd /tmp/k9s-screens-luke/k8s/washington-phl-context/'

# Enable ssh-server
alias ssh-server-enable="sudo systemctl start ssh"

# Disable ssh-server
alias ssh-server-disable="sudo systemctl stop ssh"

# View status of ssh-server
alias ssh-server-status="sudo systemctl status ssh"


# SYSTEM-SPECIFIC ALIASES
# -----------------------

# Enable and disable the touch-screen device on Ubuntu laptop (ELAN29E2:00 04F3:29E2)
TOUCH_SCREEN_DEVICE="ELAN29E2:00 04F3:29E2"
alias enable-touch="xinput list | grep '${TOUCH_SCREEN_DEVICE}' | grep -Eo 'id=[0-9]{2}' | cut -d '=' -f 2 | xargs xinput enable"
alias disable-touch="xinput list | grep '${TOUCH_SCREEN_DEVICE}' | grep -Eo 'id=[0-9]{2}' | cut -d '=' -f 2 | xargs xinput disable"


# DEFAULT CONFIG
# --------------

# Set up the prompt

# autoload -Uz promptinit
# promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
