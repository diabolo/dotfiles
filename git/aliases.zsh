# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
#
# I use JRuby substantially, and we want to make sure hub is run using MRI
# regardless of which Ruby you're using or else the `git status` in your prompt
# will take seven thousand seconds to run `ls`.
#
# I'm hardcoding it to rvm's default ruby. If this isn't set then things will go 
# bang. Using rvm's `rvm 1.8.7,ruby /hub/path` syntax is way too slow). 
# This won't effect non rvm users.
if [[ -s $HOME/.rvm/scripts/rvm ]] 
then
  # alias git='$HOME/.rvm/rubies/ruby-1.8.7-p302/bin/ruby `which hub`'
  alias git='$HOME/.rvm/rubies/default/bin/ruby `which hub`'
fi

# The rest of my fun git aliases
alias gl='git pull --rebase --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gch='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias ga='git add'
alias gst='git status'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
# pretty sure this doesn't work
# alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

function gitrm() { git status | grep deleted | awk '{print$3}' | xargs git rm;}
