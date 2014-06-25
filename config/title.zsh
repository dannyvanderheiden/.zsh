case $TERM in (*xterm*|ansi)

  # Set the terminal title and tab title when switching directories
  function settab { print -Pn "\e]1;%~\a" }
  function settitle { print -Pn "\e]2;%~\a" }
  function chpwd { settab; settitle }
  settab; settitle

  # Don't show the previous command from the history for new tabs
  NEWLY_OPENED="yes"

  # Sets the tab title to the currently running command (not process)
  preexec() {
    NEWLY_OPENED=""
    print -Pn "\e]0;★ $1\a"
  }

  # Sets the tab title to the result of the last run command (not process)
  # Also set the title when the last command has failed, because it's important
  precmd() {
    success=$?
    if [ -z $NEWLY_OPENED ]; then
      cmd=`history | tail -n 1 | sed 's/[^0-9]*[0-9]*\ \ //'`
      if [[ $success != 0 ]]; then
        print -Pn "\e]0;✘ $cmd\a"
      else
        print -Pn "\e]1;✔ $cmd\a"
        settitle
      fi
    fi
  }
  ;;
esac
