# Aliases
#########

alias cdb='base=$(git rev-parse --show-cdup) && cd $base'

alias clb='git branch --merged | egrep -v "(^\*|master|staging)" | xargs git branch -d'

alias upstash='git stash && git pull --ff-only && git stash pop'

alias push='git push'

alias st='git status'
alias status='git status'

alias co='git checkout'
alias checkout='git checkout'

alias ci='git commit'
alias commit='git commit'

alias up='git pull --ff-only'

alias br='git branch'
alias branch='git branch'

alias lg='git log -p'
alias ll='git l'
alias la='git la'

alias aa='git add --all'

alias d='git diff'
alias df='git diff'
alias dc='git diff --cached'

alias f='git fetch'
alias fetch='git fetch'

alias home_config='git config user.email "$GIT_USER_HOME_EMAIL"; export current_config_mode=$(config_mode)'
alias work_config='git config user.email "$GIT_USER_WORK_EMAIL"; export current_config_mode=$(config_mode)'


# Functions
###########

function github-init () {
  git config branch.$(git-branch-name).remote origin
  git config branch.$(git-branch-name).merge refs/heads/$(git-branch-name)
}

# Retrieve GitHub URL
function github-url () {
  git config remote.origin.url | sed -En 's/git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'
}

# Visit GitHub URL
function github-go () {
  open $(github-url)
}

unstage() {
  git reset HEAD -- $*
  echo
  git status
}

# Retrieve the current config mode (Home or Work)
function config_mode {
  user_email=$(git config user.email)

  if [[ "$user_email" == "$GIT_USER_HOME_EMAIL" ]]; then
    current_mode="home"
  else
    current_mode="work"
  fi

  echo $current_mode
}

export current_config_mode=$(config_mode)

# Reset commit dates to original dates after a rebase/reword
function reset_date {
  git rebase `echo $1` --committer-date-is-author-date
}
