# Settings
##########

# Ruby
export RUBY_HEAP_MIN_SLOTS=1100000
export RUBY_GC_HEAP_INIT_SLOTS=1100000

export RUBY_GC_MALLOC_LIMIT=110000000
export RUBY_HEAP_FREE_MIN=20000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1

# Editor
export BUNDLER_EDITOR='mvim'
export GEMEDITOR='mvim'


# Aliases
#########

# Bundler
alias be="bundle exec"

# Ruby on Rails
alias rdm='bundle exec rake db:migrate db:test:prepare'
alias rds="bundle exec rake db:seed"

# Apache
alias rr="mkdir -p tmp && touch tmp/restart.txt"

# Cucumber
alias c="cucumber --require features"
alias wip='c --profile wip'

# RSpec
alias specdoc="time rspec --format documentation"

# PRY
alias irb='pry'


# Functions
###########

# Shortcut for Rails
function r() {
  if [ -f "./script/rails" ]; then
    ./script/rails $*
  else
    ./bin/rails $*
  fi
}

# Install bundler when needed, update gems and execute command when arguments are passed
function b() {
  gem which bundler > /dev/null 2>&1 || gem install bundler --no-ri --no-rdoc
  bundle check || bundle install
  if [ $1 ]; then
    bundle exec $*
  fi
}
