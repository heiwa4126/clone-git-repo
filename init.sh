#!/bin/bash -uex
# repo0 から repo1 へクローンするテストベンチを作る

mkdir -p repo0 repo1
(
    cd repo0
    git init --bare
)
(
    cd repo1
    git init --bare
)

mkdir -p hello
(
    cd hello

    # git初期化
    git init
    git config user.email "foobar@example.com"
    git config user.name "Foo Bar"
    git config init.defaultBranch main
    git config core.symlinks true
    git config core.filemode true

    # プロジェクトの作成とコミット
    echo "hello" >hello.txt
    git add --all
    git commit -am initial

    # repo0をoriginのレポジトリにする
    git remote add origin ../repo0
    git push -u origin main

    # devブランチ(複数ブランチだとどうなるか確認用)
    git checkout -b dev
    echo "goodbye" >goodbye.txt
    git add --all
    git commit -am "add farwell"
    git push origin dev

    # mainにもどる
    git checkout main
)
rm -rf hello
