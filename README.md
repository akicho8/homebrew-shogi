# M* Mac に ShogiHome + 水匠5 を入れる方法

## インストール

```sh
brew tap akicho8/shogi
brew install --cask shogi-home
```

## 更新

```sh
brew update && brew upgrade shogi-home
```

## アンインストール

```sh
brew rm --cask shogi-home
brew rm suisho
brew rm yaneuraou
brew untap akicho8/shogi
```

## エンジン設定のみ削除

```sh
rm -rf "~/Library/Application Support/electron-shogi/usi_engine.json"
```

## 設定の全削除

```sh
rm -rf "~/Library/Application Support/electron-shogi"
```
