cask "shogi-home" do
  version "1.19.2"
  sha256 "c9791736fb4534d9ebb52a4764338911767c7be5ec63c18980e79442395a6a89"

  url "https://github.com/sunfish-shogi/shogihome/releases/download/v1.19.2/release-v1.19.2-mac.zip"
  name "ShogiHome"
  desc "ShogiHome (しょうぎほーむ) は Windows または macOS・Linux で動作する将棋アプリです。公開のソースコードを用いて独自のバージョンを作成して配布が可能です。"
  homepage "https://github.com/sunfish-shogi/shogihome"

  container nested: "ShogiHome-1.19.2-universal.dmg"
  app "ShogiHome.app"

  depends_on formula: "suisho"

  postflight do
    system_command "/usr/bin/xattr", args: ["-rd", "com.apple.quarantine", "#{staged_path}/ShogiHome.app"], sudo: true
  end

  def caveats
    <<~EOS
----------------------------------------------------------------------------------------------------
ShogiHome の初回インストール後に ShogiHome を起動したら次の設定を手動で行なってください。

1. 「エンジン管理→追加」で次のファイル追加する
   /opt/homebrew/Cellar/yaneuraou/8.30/YaneuraOu_NNUE_halfKP256-V830Git_APPLEM1
   ※ファイル選択ダイアログから Command + Shift + G で上のパスを入力する

2. そのエンジンの設定の「評価関数のフォルダ」に次のディレクトリを指定する
   /opt/homebrew/Cellar/suisho/5

上の説明は brew info shogi-home で再度確認できます。
----------------------------------------------------------------------------------------------------
  EOS
  end
end
