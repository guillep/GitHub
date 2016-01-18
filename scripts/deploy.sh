#!/bin/bash

pushd ../ > /dev/null
git worktree add master master
git worktree add gh-pages gh-pages
popd > /dev/null

./build.sh

pushd ../ > /dev/null

pushd gh-pages > /dev/null
git add .
git commit -m "Build documentation."
popd > /dev/null

rm -r gh-pages
git worktree prune -v
popd > /dev/null
