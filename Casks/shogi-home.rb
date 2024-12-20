cask "shogi-home" do
  desc "ShogiHome は Windows または macOS・Linux で動作する将棋アプリです。公開のソースコードを用いて独自のバージョンを作成して配布が可能です。"
  homepage "https://github.com/sunfish-shogi/shogihome"
  name "ShogiHome"

  version "1.19.2"
  sha256 :no_check
  url "https://github.com/sunfish-shogi/shogihome/releases/download/v1.19.2/release-v1.19.2-mac.zip"

  container nested: "ShogiHome-1.19.2-universal.dmg"

  # License: MIT
  # The software is licensed under the MIT License.

  app "ShogiHome.app"

  depends_on formula: "suisho"

  postflight do
    system_command "/usr/bin/xattr", args: ["-rd", "com.apple.quarantine", "#{staged_path}/ShogiHome.app"], sudo: true
  end

  def caveats
    <<~EOS
----------------------------------------------------------------------------------------------------
ShogiHome を起動したら初回のみ次の設定を手動で行なってください。

1. 「エンジン管理→追加」で次のファイルを指定する
   /opt/homebrew/opt/yaneuraou/YaneuraOu_NNUE_halfKP256-V830Git_APPLEM1
   ※ファイル選択ダイアログから Command + Shift + G で上のパスを入力する

2. 「エンジン管理→設定」の「評価関数のフォルダ」に次のディレクトリを指定する
   /opt/homebrew/opt/suisho

3. 「エンジン管理→設定」の「評価値スケール FV_SCALE」を 24 に変更する

この説明は brew info shogi-home で再度確認できます。
----------------------------------------------------------------------------------------------------
  EOS
  end

  # cask の場合 brew test で実行できない
  # test do
  #   assert_predicate "/Applications/ShogiHome.app", :exist?, "ShogiHome が正しくインストールされていません"
  # end
end
