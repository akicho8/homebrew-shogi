# M2 Mac に ShogiHome + 水匠を Brew で入れる手順

## 初回

```
brew tap akicho8/shogi
brew install --cask shogi-home
```

`/Applications/ShogiHome` を `open -a ShogiHome` で起動できるのを確認したら次へ↓

## 水匠を登録する

```
$ brew info shogi-home
----------------------------------------------------------------------------------------------------
ShogiHome を起動したら初回のみ次の設定を手動で行なってください。

1. 「エンジン管理→追加」で次のファイルを指定する
   /opt/homebrew/opt/yaneuraou/YaneuraOu_NNUE_halfKP256-V830Git_APPLEM1
   ※ファイル選択ダイアログから Command + Shift + G で上のパスを入力する

2. 「エンジン管理→設定」で以下を指定する
   ・評価関数のフォルダ → /opt/homebrew/opt/suisho ※必須
   ・評価値スケール     → 24                       ※謎
   ・マルチPV           → 5                        ※検討時の候補手の数

この説明は brew info shogi-home で再度確認できます。
----------------------------------------------------------------------------------------------------
```

本当はこの部分も自動化したかった。
この設定は `~/Library/Application Support/electron-shogi/usi_engine.json` に保存されるので、これを生成して配置すればいいのかもしれないが、
アプリの更新があれば、そのうち不整合で動かなくなりそうなのでやめておく。
ShogiHome のコマンドラインでエンジンの追加やパラメータの変更が可能になれば自動化できる。

## 更新するには？

```
brew update
brew upgrade shogi-home
```

ごちゃごちゃになってしまった場合は完全削除して入れ直すのでもいい。

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

## 疑問や課題

- Brew の Formula の中から何をやっても mkdir できない
  - だから eval ディレクトリを作れず nn.bin を置けない
  - でも /tmp/foo は作れる
  - SIP のせい？？？
  - でも ShogiHome 側で nn.bin の置き場所を指定できたのでなんとかなった
- ShogiHome でエンジンを指定するときファイラー(Finder ？)が開いてしまうため `/opt/homebrew/opt/yaneuraou/YaneuraOu_NNUE_halfKP256-V830Git_APPLEM1` を選択する過程で `/opt/homebrew/Cellar/yaneuraou/8.30/YaneuraOu_NNUE_halfKP256-V830Git_APPLEM1` にパスが変わってしまう
