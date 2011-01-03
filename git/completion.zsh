autoload bashcompinit
bashcompinit
if [ -f ~/.git-completion ]; then
  echo "ZSH: ~/.git-completion found"
  source ~/.git-completion
  echo "ZSH: ~/.git-completion loaded"
else
  echo "ZSH: ~/.git-completion not found"
fi
