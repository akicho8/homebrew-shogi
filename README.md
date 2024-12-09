# Mac に ShogiHome + 水匠を Brew で入れる手順

## 初回

```
brew tap akicho8/shogi
brew install --cask shogi-home
open -a ShogiHome
```

次に進む↓

## 開発元を疑われる

1. 「"ShogiHome.app" は、開発元を検証できないため開けません」と言われるので「キャンセル」する
1. `open x-apple.systempreferences:com.apple.preference.security` を実行する (システム設定のプレイバシーとセキュリティが開く)
1. 「"ShogiHome.app" は、開発元を確認できないため、使用がブロックされました」の下にある「このまま開く」をクリックする
1. さらに「開く」をクリックするとやっと ShogiHome が起動する

次に進む↓

## ShogiHome に水匠を登録

1. 「エンジン管理」→「追加」で `/opt/homebrew/Cellar/yaneuraou/8.30/YaneuraOu_NNUE_halfKP256-V830Git_APPLEM1` を指定する。
   ここではダイアログから選択しないといけないのだが `/opt` の下に行くが難しいため `Command + Shift + G` で上のパスを入力するのがてっとりばやい。
1. そのエンジンの設定の「評価関数のフォルダ」に `/opt/homebrew/Cellar/suisho/5` を指定する。直接指定すれば eval の下に nn.bin を置く作業は不要になる。

以上。

本当はこの部分も自動化したかった。
この設定は `~/Library/Application Support/electron-shogi/usi_engine.json` に保存されるので、これを生成して配置すればいいのかもしれないが、
アプリの更新があれば、そのうち不整合で動かなくなりそうなのでやめておく。
ShogiHome のコマンドラインでエンジンの追加やパラメータの変更が可能になれば自動化できる。

## 更新するには？

```
brew update
brew upgrade shogi-home
```

## 完全削除するには？

```
brew rm --cask shogi-home
brew rm suisho
brew rm yaneuraou
brew untap akicho8/shogi
```

必要であれば `~/Library/Application Support/electron-shogi` も消す。

## Brew での依存関係は？

ShogiHome → 水匠 → やねうら王

## よくわかってないところ

- Brew の Formula の中から何をやっても mkdir できない
  - だから eval ディレクトリを作れず nn.bin を置けない
  - でも /tmp/foo は作れる
  - SIP のせい？？？
