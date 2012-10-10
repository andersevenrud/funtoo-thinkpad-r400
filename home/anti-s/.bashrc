# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# History control: Ignore dupes and misc commands
export HISTCONTROL=ignoredups
export HISTIGNORE="&:??:[ ]*:clear:exit:logout"

# handy extract function for various archives
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Nice output and secure deletion
if [ "$TERM" != "dumb" ]; then
  eval "`dircolors -b`"
  alias ls='ls -lA -F -h -X --group-directories-first --color=always'
fi
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias rm='rm -iv'
alias cp='cp -vR'

# Handy directory aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Prompt
BGREEN='\[\033[1;32m\]'
GREEN='\[\033[0;32m\]'
BRED='\[\033[1;31m\]'
RED='\[\033[0;31m\]'
BBLUE='\[\033[1;34m\]'
BLUE='\[\033[0;34m\]'
NORMAL='\[\033[00m\]'
PS1="${BLUE}(${RED}\w${BLUE}) ${NORMAL}\h ${RED}\$ ${NORMAL}"

# Locals
export EDITOR=vim
export BROWSER="chromium-browser '%s' &"

GPG_TTY=`tty`
export GPG_TTY
