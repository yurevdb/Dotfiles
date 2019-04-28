#!/bin/sh

case $1 in
  "cp") /home/yure/.scripts/git_commit_and_push.sh $2;;
  *) echo "No script found that matches that description.";;
esac
