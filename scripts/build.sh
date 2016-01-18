#!/bin/bash

if [ ! -d ../master ]; then
  pushd ../ > /dev/null
  git worktree add master master
  popd > /dev/null
fi

./doclink.py --source-directory="../master/" --prefix="https://github.com/Balletie/GitHub/tree/master"

pushd ../ > /dev/null
rm -r master
git worktree prune -v

[ ! -d gh-pages ] && mkdir gh-pages

./pillar export
git checkout -- *.pillar
popd > /dev/null
