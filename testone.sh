#!/bin/bash
FILE=$1
IGNOREFILES="./worktable/dimple_vectors.scad ./electrocookie/parameters.scad ./drawer/TOUL.scad"
# Do not test external libraries imported as submodules
IGNOREDIRS="./Write.scad "

SUBMODULES=$(grep "path =" .gitmodules | cut -d '=' -f 2 | tr -d " ")
DIR="$(dirname "${FILE}")"
BASE="$(basename "${FILE}")"

TOPDIR=`echo $DIR | cut -f 1 -d '/'`
if [ "$TOPDIR" == "." ]
then 
  TOPDIR=`echo $DIR | cut -f 2 -d '/'`
fi

#echo $SUBMODULES
#echo $TOPDIR
#echo $SUBMODULES | grep -wq $TOPDIR

if echo $SUBMODULES | grep -wq $TOPDIR
then
  echo "Skipping submodule $TOPDIR"
else
  pushd ${DIR} &> /dev/null
  if echo $IGNOREFILES | grep -wq $FILE
  then
    echo "Skipping $FILE"
  elif echo $IGNOREDIRS | grep -wq $DIR
  then  
    echo "Skipping directory $DIR"
  elif echo $DIR | grep '.git'
  then
    echo "Skipping git hidden files"
  else
    echo "Testing $BASE in $DIR"
    STLFILE="${BASE%.*}.stl"
    time openscad -o $STLFILE --hardwarnings -D '$fn=2' $BASE
    if [ "$?" != "0" ]
    then
      echo "FAIL: $FILE"
      exit 1
    else
      rm -f $STLFILE
    fi
  fi
  popd &> /dev/null
fi