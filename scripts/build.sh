#!/bin/bash

if [ ! -d ../master ]; then
  pushd ../ > /dev/null
  git worktree add master master
  popd > /dev/null
fi

# First stage the changes, before overwriting them.
git add .
./doclink.py --source-directory="../master/" --prefix="https://github.com/Balletie/GitHub/tree/master"
if [ "$?" -ne "0" ]; then
  echo "doclink.py exited with error, cleaning up.."
  pushd ../ > /dev/null
  rm -r master
  git worktree prune -v
  git checkout -- *.pillar
  popd > /dev/null
  exit 1
fi

pushd ../ > /dev/null
rm -r master
git worktree prune -v

[ ! -d gh-pages ] && mkdir gh-pages

./pillar export

[ -f gh-pages/html-chap/getting-started.html ] && ln -s gh-pages/html-chap/getting-started.html gh-pages/html-chap/index.html && echo 'Created link for index.html'
# Discard changes done by doclink.py
git checkout -- *.pillar
popd > /dev/null
