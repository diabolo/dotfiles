autoload -Uz vcs_info
autoload colors && colors

zstyle ':vcs_info:*' stagedstr '%F{green}●%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{red}:%f%F{yellow}%r%f'
zstyle ':vcs_info:*' enable git 

precmd () {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
    #zstyle ':vcs_info:*' formats '%F{cyan}[%b%c%u%f%F{cyan}]%f'
    zstyle ':vcs_info:*' formats '%F{yellow} (%b%c%u)'
  } else {
    zstyle ':vcs_info:*' formats '%b%c%u%F{red}●%f'
  }
  vcs_info
  get_rvm_prompt
  truncate_pwd
}

function get_rvm_prompt {
  if $(which rvm &> /dev/null)
  then
    RVM_PROMPT=$(~/.rvm/bin/rvm-prompt u g)
  else
    RVM_PROMPT=""
  fi
}

function truncate_pwd {
# How many characters of the $PWD should be kept
  local pwdmaxlen=25
# Indicate that there has been dir truncation
  local trunc_symbol=".."
  local dir=${PWD##*/}
  pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
  NEW_PWD=${PWD/#$HOME/\~}
  local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
  if [ ${pwdoffset} -gt "0" ]
  then
    NEW_PWD=$NEW_PWD[$pwdoffset,${#NEW_PWD}] 
    NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
  fi
}  




function vcs_inf {
  echo -ne "${vcs_info_msg_0_}$reset_color"
}

function rvm_inf {
  echo -ne "$fg[red] $RVM_PROMPT $reset_color"
}

function directory_name {
#  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
  #echo ${PWD/#$HOME/~}
  echo -ne "$fg[blue]${NEW_PWD}$reset_color"
}

function user_loc_pwd {
  local UC="$fg[green]"                 # user's color
  [ $UID -eq "0" ] && UC="%F{yellow}"  # root's color

  echo "$fg[black][${UC}%n@%m $(directory_name)$fg[black]]"
}

function set_prompt {
# regular colors

    
  PROMPT=$'$(user_loc_pwd)$(vcs_inf)$(rvm_inf)\n${UC}➥  $reset_color'
  RPROMPT=""

}
set_prompt
