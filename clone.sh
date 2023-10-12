#!/bin/bash -uex
# repo0 から repo1 へ複製

rm -rf hello2
git clone ./repo0 hello2
cd hello2

# see <https://stackoverflow.com/questions/67699/how-do-i-clone-all-remote-branches>
for branch in $(git branch -a | grep '^\s*remotes' | grep -Ev '(:?HEAD|master|main)$'); do
  git branch --track "${branch##*/}" "$branch"
done
## * デフォルトブランチがmasterでもmainでもなかったら? は考えないことにする
## * masterとmainブランチが両方ともあったら? も考えないことにする

git fetch --all
git pull --all

git remote rename origin origin.bak
git remote add origin ../repo1
## 後から考えたらoriginを置き換える必要はなかった
## そのまま残す

git push origin --all
