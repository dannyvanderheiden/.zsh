# Settings
##########

# Shell
export SHELL=$(which zsh)


# Options
##########

# Multiple zsh's all append to same history file (rather than last # overwrites)
setopt appendhistory
# Beep!
setopt beep
# Treat the #, ~ and ^ characters as part of patterns for filename generation
setopt extendedglob
# Print an error if a pattern for filename generation has no matches
setopt nomatch
# Ignore duplications in history
setopt hist_ignore_all_dups
# Don't name directories automatically
unsetopt auto_name_dirs
# Use own prompt
setopt prompt_subst

# History
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
# Ignore commands in history
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear:clr"
