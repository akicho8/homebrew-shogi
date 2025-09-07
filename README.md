# M* Mac に ShogiHome + 水匠を Brew で入れる手順

## 初回

```
brew tap akicho8/shogi
brew install --cask shogi-home
```

## 更新

```
brew update && brew upgrade shogi-home
```

## 削除

```
brew rm --cask shogi-home
brew rm suisho
brew rm yaneuraou
brew untap akicho8/shogi
```
