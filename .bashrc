#!/bin/bash
# Giant Binary root
export GIANT_ROOT_DIR='/opt/giant'
export MY_GIANT_SCRIPTS='~/gScripts'
export PATH=${GIANT_ROOT_DIR}/bin:${MY_GIANT_SCRIPTS}:${PATH}

# Giant Data Location
export GIANT_DATA_ROOT='/jobs/mocap'
export GIANT_DATA_DIR=${GIANT_DATA_ROOT}/150829_A2_Test1



# Helpers
alias  ll='/bin/ls -lhp'
alias cpd='/bin/cd $1;/bin/pwd'

# Misc
alias hog='/bin/top -o cpu'

# Envars for the gScripts
export GS_PERSIST_FILE=~/.gsPersist

# Source the Giant Scripts
source $MY_GIANT_SCRIPTS/gfuncs.bsh

# load the persistent workspace
iudpws

# Short Prompt
#export PS1="[\!]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \[\033[01;33m\]\$\[\033[0m\] "

# shiny Prompt
function prompt {
  # some definitions, local so as not to pollute the env.
  local RESET="\[\017\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"


  export PS1="$RESET$YELLOW[$RESET\!$YELLOW]$BLUEBOLD\u@\h $GREENBOLD\W$CYAN\$ "
  #export PS1="\n\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}$BLACKBOLD[\t]$PURPLEBOLD \u@\h\[\033[00m\]:$BLUEBOLD\w\[\033[00m\] \\$ "
}
prompt
