class Yaneuraou < Formula
  desc "やねうら王は、WCSC29・第4回世界将棋AI電竜戦本戦等で優勝した世界最強の将棋の思考エンジン"
  homepage "https://github.com/yaneurao/YaneuraOu"

  url "https://github.com/yaneurao/YaneuraOu/releases/download/v8.30git/yaneuraou-V830-git-mac-all.7z"
  sha256 "3c4a65f0e9018ba6fb745f01239b6aeb4710d42ed60af43599440b3f9c41febe"

  def install
    if Hardware::CPU.intel?
      if Hardware::CPU.features.include?(:avx2)
        prefix.install "YaneuraOu_NNUE_halfKP256-V830Git_APPLEAVX2"
      end
      if Hardware::CPU.features.include?(:sse4_2)
        prefix.install "YaneuraOu_NNUE_halfKP256-V830Git_APPLESSE42"
      end
    end
    if Hardware::CPU.arm?
      prefix.install "YaneuraOu_NNUE_halfKP256-V830Git_APPLEM1"
    end
  end
end
