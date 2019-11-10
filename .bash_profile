[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# MacPorts Installer addition on 2012-07-14_at_22:32:29: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# addition for pear (i think) and pecl on July 14th, 2012
export PATH=/Users/noah/pear/bin:$PATH
# the above addition was made while trying to install imagemagick for php.

#addition for lessc, less css compiler,  on July 29th, 2012
export PATH=/Users/noah/node_modules/less/bin:$PATH

#addition for woff2otf, November 29th, 2012
export PATH=/Users/noahgilmore/bin:$PATH

export PATH=~/Library/Python/2.7/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### mysql from the commandline with mamp
export PATH="/Applications/MAMP/Library/bin:$PATH"

function github() {
  result=${PWD##*/}
  open "https://github.com/noahsark769/$result"
}

### easy stuff for django
alias manage="ipython manage.py"
alias rs="python manage.py runserver"
alias psh="ipython manage.py shell"

### easy navigaiton
alias cdp="cd ~/Documents/programming"
alias cdc="cd ~/Documents/classes"
function md() {
  mkdir "$1"
  cd "$1"
}
alias up="cd .."
alias jj="clear"

eval "$(aactivator init)"

### shortcuts for git
alias editprof="vim ~/.bash_profile"
alias sourceprof="source ~/.bash_profile"
alias co="git-fuzzy-co"
alias c="git branch --sort=committerdate | tail -n 10"
alias b="git branch"
alias bd="git branch -D"
alias setupstreammaster="git branch --set-upstream-to=origin/master"
alias gg="git grep -n"
alias gs="git status"
alias stash="git stash"
alias gaa="git add -A"
alias gcm="git commit -m"
alias com="git checkout master"
alias gd="git diff"
alias gl="git log"
alias gpo="git push origin"
alias grc="git rebase --continue"
alias gprom="git pull --rebase origin master"
alias gp="git pull"
alias gls="git ls-files"
alias server="python -m SimpleHTTPServer"
alias grao="git remote add origin"
alias gpomauh="git pull origin master --allow-unrelated-histories"

function copysha {
  git log -n 1
  sha=$(git log --pretty=format:'%H' -n 1)
  echo $sha | pbcopy
  echo "Copied $sha"
}

function cb {
  branch=$(git rev-parse --abbrev-ref HEAD)
  echo $branch
  echo $branch | tr -d '\n' | tr -d ' ' | pbcopy
}

function blameline {
  cmd="git log -u -L $2,$2:$1"
  echo $cmd
  $cmd
}

### shortcuts for vagrant
alias v="vagrant" # got damn that word is hard to type

### don't trouble me with stupid shit, mysql
alias mysql="mysql -u root -p"

source ~/.bash_prompt
