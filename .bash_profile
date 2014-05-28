
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
export PATH=/Users/noah/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### mysql from the commandline with mamp
export PATH="/Applications/MAMP/Library/bin:$PATH"

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

### shortcuts for git
alias push="git push origin"
alias pull="git pull origin"
alias fetch="git fetch"
alias add="git add"
alias commit="git commit"
alias merge="git merge"
alias status="git status"

### shortcuts for vagrant
alias v="vagrant" # got damn that word is hard to type

### shortcuts for calband deployment
alias calbandpush="python /Users/noah/Documents/programming/calband/calband-deploy/push.py"

### edit this file really easily
alias editprof="vim ~/.bash_profile"
alias sourceprof="source ~/.bash_profile"

### don't trouble me with stupid shit, mysql
alias mysql="mysql -u root -p"

source ~/.bash_prompt

### nice stuff for git and prompt
source /usr/local/git/contrib/completion/git-completion.bash
# GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='\h:\W$(__git_ps1) \u\$ '
#if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#  c_reset=`tput sgr0`
#  c_user=`tput setaf 5; tput bold`
#  c_path=`tput setaf 4; tput bold`
#  c_git_clean=`tput setaf 2`
#  c_git_dirty=`tput setaf 1`
#else
#  c_reset=
#  c_user=
#  c_path=
#  c_git_cleanclean=
#  c_git_dirty=
#fi
#git_prompt ()
#{
#  if ! git rev-parse --git-dir > /dev/null 2>&1; then
#    return 0
#  fi
#
#  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
#
#  if git diff --quiet 2>/dev/null >&2; then
#    git_color="${c_git_clean}"
#  else
#    git_color=${c_git_cleanit_dirty}
#  fi
#
#  echo " [$git_color$git_branch${c_reset}]"
#}
#PS1='\h:\W \u\$ '
#PS1='${c_user}\h${c_reset}:${c_path}\W${c_reset}$(git_prompt)\$ '
