autoload bashcompinit
bashcompinit
if [ -d "~/.git-completion" ];
then
  source ~/.git-completion;
else
  echo "ZSH: ~/.git-completion not found"
fi
