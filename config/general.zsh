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

# Directories
alias downloads="cd $HOME/Downloads"

# Tmux in utf-8 mode
alias t="tmux -u"

# Colors in less
alias less='less -R'

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
