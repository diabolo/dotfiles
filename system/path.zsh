# lets see how our path comes out first before hacking it.
# export PATH=".:bin:/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH

# Path
#
# As we are using homebrew as our main package manager we need to prioritize /usr/local/bin
export PATH=/usr/local/bin:$PATH

# The following paths will only be included if they exist. We should aim to have as little 
# here as possible, i.e. use Homebrew and rely on /usr/local/bin

# Home bin 
if [ -d "${HOME}/bin" ] ; then PATH=${HOME}/bin:${PATH}; fi

# Homebrews python - we need to keep this
if [ -d "/usr/local/Cellar/python/2.7/bin" ]; then export PATH=/usr/local/Cellar/python/2.7/bin:${PATH}; fi

# Haskell - remove when you confirm Homebrew haskell-platform brew works
if [ -d "~/.cabal/bin" ]; then export PATH=/Users/andy/.cabal/bin:$PATH; fi  

# mysql - remove this when you confirm Homebrew mysql brew works
if [ -d "/usr/local/mysql/bin" ]; then export PATH=/usr/local/mysql/bin:$PATH; fi

# node.js and npm 
if [ -d "/usr/local/lib/node" ] ; then export NODE_PATH="/usr/local/lib/node"; fi
if [ -d "/usr/local/share/npm/bin" ]; then export PATH="/usr/local/share/npm/bin:$PATH"; fi

# RVM include has to go here: using one in ruby/rvm.zsh fails to load rvm default
# ruby when starting a new shell
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
