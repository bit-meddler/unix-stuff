#!/bin/bash
# ~/gScripts/gfuncs.bsh

# convenience
alias cdd='cd $GIANT_DATA_DIR;/bin/pwd'
alias cddd='cd $GIANT_DATA_DIR;/bin/pwd;/bin/ls'

###############
# set workspace
isetws() {
  # either take cwd or $1 as the target ws
  NEW_WS_DIR=${1-$PWD}
  # TODO: test $1, maybe offer help

  # Escape from relative addressing and get a canonical path to this place
  NEW_WS_DIR=`(cd $NEW_WS_DIR;/bin/pwd)`

  # Note the path
  WS_BASENAME=$(basename $NEW_WS_DIR)

  # set session ws
  export GIANT_DATA_DIR=$NEW_WS_DIR
  export BIO_DATA_DIR=$NEW_WS_DIR
  export NU_DATA_DIR=$NEW_WS_DIR

  # setup rttrack's paths
  # ws has rttrack (created as Giant capture day)
  if [ -d $NEW_WS_DIR/rttrack ]; then
    export BIO_RTTRACK_DIR=$NEW_WS_DIR/rttrack
    export GIANT_RTTRACK_DIR=$NEW_WS_DIR/rttrack
    RTT_SOURCE=", with session's rttrack"
  else
    # this seems largely surplus, as there is no $GIANT_DIR envar
    if [ x"$GIANT_DIR" != x ]; then
        G_ROOT=$GIANT_DIR
    else
        G_ROOT=$BIO_DIR
    fi
    if [ -d $G_ROOT/rttrack ]; then
        export BIO_RTTRACK_DIR=$G_ROOT/rttrack
        export GIANT_RTTRACK_DIR=$G_ROOT/rttrack
        RTT_SOURCE=", with default rttrack"
    else
        RTT_SOURCE="."
    fi

  fi
  # RETORT
  echo "Updated Giant Workspace to $WS_BASENAME$RTT_SOURCE"
}

###############################
# cheat workspaces between envs
isetpws() {
  if [ -z "$1" ]; then
    echo "did you mean to udsup?"
  else
    echo $1 > ${GS_PERSIST_FILE}
    isetws $1
    echo "This will persist, update your other environs with 'isetpws'"
  fi
}


iudpws() {
  if [ -z "$1" ]; then
    while read -r line
    do
      isetws $line
    done < ${GS_PERSIST_FILE}
  else
    echo "did you mean to 'isetpws $1'?"
  fi
}