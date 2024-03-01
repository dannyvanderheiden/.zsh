# Aliases
##########

# Listing files
alias l='ls -halo'
alias ltr='ls -lt'
alias lth='l -t|head'
alias lh='ls -Shl | less'
alias tf='tail -f -n 100'

# VIM
alias m='mvim --remote-silent'
alias mvim="/Applications/MacVim.app/Contents/MacOS/Vim -g"

# Directories
alias downloads="cd $HOME/Downloads"

# Tmux in utf-8 mode
alias t="tmux -u"

# Colors in less
alias less='less -R'

# Coverage
alias cov='open coverage/index.html'

# Create project aliases by defining project root directories
for PARENT_DIR in ${PROJECT_PARENT_DIRS[@]} ; do
  if [ -d "$PARENT_DIR" ]; then
    for PROJECT_DIR in $(/bin/ls $PARENT_DIR); do
      if [[ ! -z `which $PROJECT_DIR 2> /dev/null` ]]; then
        if [ -d "$PARENT_DIR/$PROJECT_DIR" ]; then
          alias "$PROJECT_DIR"="cd $PARENT_DIR/$PROJECT_DIR"
        fi
      fi
    done
  fi
done


# Settings
##########

# Locales
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Paths
export PATH="/sbin:$PATH"
if [[ -d "$HOME/.rvm/bin" ]]; then
  export PATH=$PATH:$HOME/.rvm/bin
fi
if [[ -d "/usr/local/sbin" ]]; then
  export PATH=$PATH:/usr/local/sbin
fi

# Editor
export EDITOR=vim
export VISUAL=mvim
export GIT_EDITOR=vim
export SVN_EDITOR=vim


# Functions
###########

# Grep process
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# Edit hosts-file
if [ "`id -u`" -eq 0 ]; then
  alias hosts="mvim /etc/hosts"
else
  alias hosts="sudo mvim /etc/hosts"
fi
