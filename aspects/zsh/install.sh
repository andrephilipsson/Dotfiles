#!/bin/sh

for FILE in files/.*; do

  if ! [ -e $HOME/$(basename $FILE) ]; then
    ln -sf $PWD/$FILE $HOME/$(basename $FILE)
    echo "Symlinked $FILE to ~"
  else
    echo "$FILE file already exist in ~/"
  fi
done

