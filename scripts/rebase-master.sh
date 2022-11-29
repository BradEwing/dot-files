#!/bin/bash

curBranch=$(git branch --show-current)

if [[ $curBranch == "master" ]];
then
  echo "current branch is master, nothing to do"
  exit 0
fi

if [[ -z "$curBranch" ]]
then
  echo "no branch found"
  exit 1
fi

git checkout master
git pull origin master
git checkout $curBranch
git rebase master
