# clone-git-repo

git レポジトリをクローンするサンプルスクリプト。

## 動かし方

```bash
# レポジトリ2つ (repo0, repo1)を作る
./init.sh

# repo0 を repo1に複製
./clone.sh

# あとしまつ
./clean.sh
```

## 参考

- [git - How do I clone all remote branches? - Stack Overflow](https://stackoverflow.com/questions/67699/how-do-i-clone-all-remote-branches)

## 他メモ

2 つのレポジトリが両方ともローカルにあれば

```bash
git clone --mirror <src> <dest>
```

が一番簡単。
