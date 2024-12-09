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
end
