#!/bin/bash

pushd ../ > /dev/null
git worktree add master master
git worktree add gh-pages gh-pages
cd gh-pages
[ "$?" -ne "0" ] && rm -r ./*
popd > /dev/null

./build.sh
if [ "$?" -ne "0" ]; then
  echo "build.sh exited with error, cleaning up.."
  pushd .. > /dev/null
  rm -r gh-pages
  git worktree prune -v
  popd > /dev/null
  exit 1
fi

pushd ../ > /dev/null

pushd gh-pages > /dev/null
git add .
git commit -m "Build documentation."
git push origin gh-pages
popd > /dev/null

rm -r gh-pages
git worktree prune -v
popd > /dev/null
