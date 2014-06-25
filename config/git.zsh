# Aliases
#########

alias cdb='base=$(git rev-parse --show-cdup) && cd $base'

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

alias home_config='git config user.email "$GIT_USER_HOME_EMAIL"'
alias work_config='git config user.email "$GIT_USER_WORK_EMAIL"'


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
