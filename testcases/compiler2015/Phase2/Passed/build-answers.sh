#!/bin/bash

CC=gcc

rm *.ans

for source in `ls *.c`; do
  rm -f /tmp/program
  $CC -m32 $source -o /tmp/program 2>&1
  if [ $? -ne 0 ]; then
    echo $source CE?!
    exit
  fi
  if [ -f /tmp/program ]; then
    cn=${source%.c}
    echo now outputing to ${cn}.ans
    time /tmp/program > $cn.ans
  fi
done

