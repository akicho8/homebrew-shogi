cask "shogi-home" do
  version "1.26.0"

  desc "ShogiHome は Windows・macOS・Linux で動作する次世代のGUI将棋アプリです。"
  homepage "https://github.com/sunfish-shogi/shogihome"
  name "ShogiHome"
  sha256 :no_check
  url "https://github.com/sunfish-shogi/shogihome/releases/download/v#{version}/release-v#{version}-mac.zip"

  container nested: "ShogiHome-#{version}-universal.dmg"

  # License: MIT
  # The software is licensed under the MIT License.

  app "ShogiHome.app"

  depends_on formula: "suisho"

  postflight do
    config_file = Pathname("~/Library/Application Support/electron-shogi/usi_engine.json").expand_path

    puts "1. ダウンロード元警告を削除します"
    system_command "/usr/bin/xattr", args: ["-rd", "com.apple.quarantine", "#{staged_path}/ShogiHome.app"], sudo: true # staged_path == "/opt/homebrew/Caskroom/shogi-home/#{version}"
    puts "=> OK"

    puts "2. 初期設定を行います (初回のみ)"
    if config_file.exist?
      puts "=> すでに設定ファイル #{config_file} が存在するため初回ではないと判断してスキップしました。"
      puts "=> もし初期設定の方法がわからない場合は、いったんそのファイルを削除してから brew reinstall shogi-home を実行してください。"
    else
      # https://github.com/sunfish-shogi/shogihome/wiki/%E8%B5%B7%E5%8B%95%E6%99%82%E5%BC%95%E6%95%B0%E3%81%AE%E4%BB%95%E6%A7%98#%E3%83%98%E3%83%83%E3%83%89%E3%83%AC%E3%82%B9%E3%83%A2%E3%83%BC%E3%83%89v1250-%E6%96%B0%E6%A9%9F%E8%83%BD
      system_command "/Applications/ShogiHome.app/Contents/MacOS/ShogiHome",
      args: [
        "--add-engine",
        "/opt/homebrew/opt/yaneuraou/YaneuraOu_NNUE_halfKP256-V830Git_APPLEM1",
        "やねうら王 + 水匠5",
        "30",
        "H4sIAAAAAAAAE52XXW/iOBSG/4uvwzQ44aPcdUrZVgtt1bKdi9WqMsQlFsZGjgODRvz3lfN5HGImGq7i94TzxMc+b5xfKFnHdEfQBNFkcnOTJqxHxYYJ2pN7zaRIemvO9itJVNSLiCbIQ0UATX6hZawoibJLQXYUTSrFQ/q0N0KyZ8L8SUVUoUnf9z0U0S+Sco0moYd2TKBJ30M78tNEceihA+EpRZPw7KF/3p8+H0kSA0AlOQl9QMgzWpAgGAzCMMAVyNxTsF6lyJJYtEKseOuYrrcQiAEQfRGeUFQlL8ZnD71ruY5Jotn6EnMZc9OCTrRFyjV7/QCMUnHWLYR1axRtaNatgAzOHnqm+ijVdko5OQGGJTtBAwjCfoHyq03gA1gf+w0cdvCwGziEwN8Sc+SCCbZLd8uYiS0TmyUzwLqYLVEnfgTwOEPltc0vqyeoH8HcZHYMl8eFPNg7pdKcuLG1//2LHoNzzTgL8tOkTJZyqsgRztIOOIm3gNha3JpoeFO61/Gc7ZgGLCC6OH3/Cgf3w1E4DobhyGI9y4gmTRYQnaz+FdYtxkEwwn4wHA/C0WjYnODDgfApg8tWKjVOKyY2EGi5CD0QDtr6Ru71TSx3dKXoMRskKUtiaTr9h2KaTukq3czlBiBt/QrYMhST8S8qqCKa3nE+pxvCsz0AMrfHnY7VDzs51oPQ1Dza30xs3lIOu+0iVLPkbiUha2AyqwRN/kXPEv4Peej+/c78G4fw+hEMRvDaBJbqlPH+gzOAd5ezqLXiTfJyFN+l3DZeJaXqrhW0KqRVCkuVDc2eJkrJYyM9EN3ZR51WwiRprnmtOTvG8p3hdY8dFpinjZCKvhFNGywQcAJ/YztWS5qcM8abmExy7ibs17tJyM9VXtxEExERFWXjb9EKeehEBE0VyZT+pYQvpeBSCnMpTaiCiaoxboyLFNlTrJiwN2nLQ5brfBEqymM7Vqm4jQNDi0RFcUpINiwS5+b39dXIXsmuBcbQEoMLEza/Chj4APadk/W2afotQSc4aNlZvQLYAofsHzHT1MUGQScbumWvH3bAm7vKNWx7tTYCTvLgWgPbyKqBX8QypjN+auAq2elFeNjJi+6lSFhEVek/9zIVcG7tcTe1uwO+Hto8sFSdRYQuOG6cvXA4rGDjs4dyk8vSWhW0dfdkbjtNZsbZfk+jxvsCqk5C4Hd4HZmz4YfRss6CRzo74CpZAH2kh8v9Hvj1+Tiw3h49DKlZT7VR84CTiv+E+np4MmcKczqriUB00gLLytoPyZAWZCfzN5qwjfjIpYoHVScQ2khpHe5+zkag3Yj5xF/IiLa0Wh1z75tBh33zkup9qmeE8fmj9aXaCLgpXQ5Ls4/P9/u7+QPc+qXkLN6ozQmrLyjT4+WXWng+e4gKsuL0gSh+Kj/ts+47/w9uolEAXxEAAA=="
      ]
      puts "=> OK"
    end

    puts "#{version} のインストールが完了しました"
  end

  def caveats
    <<~EOS
----------------------------------------------------------------------------------------------------
▼起動するには？
open -a ShogiHome

▼KIFファイルを指定して起動するには？
open -a ShogiHome --args path/to/file.kif

▼設定ファイルの場所
~/Library/Application Support/electron-shogi/usi_engine.json

▼今後のバージョンアップに追随するには？ (これより ~/.Brewfile で管理する方がもっと良い)
brew update && brew upgrade shogi-home

この説明は brew info shogi-home で確認できます。
----------------------------------------------------------------------------------------------------
  EOS
  end
end
