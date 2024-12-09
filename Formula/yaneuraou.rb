class Yaneuraou < Formula
  version "8.30"
  sha256 "3c4a65f0e9018ba6fb745f01239b6aeb4710d42ed60af43599440b3f9c41febe"
  url "https://github.com/yaneurao/YaneuraOu/releases/download/v8.30git/yaneuraou-V830-git-mac-all.7z"

  desc "やねうら王は、WCSC29(世界コンピュータ将棋選手権/2019年)、第4回世界将棋AI電竜戦本戦(2023年)などにおいて優勝した世界最強の将棋の思考エンジンです。教育的でUSIプロトコルに準拠しています。"
  homepage "https://github.com/yaneurao/YaneuraOu"

  def install
    if Hardware::CPU.intel?
      if Hardware::CPU.features.include?(:avx2)
        prefix.install Dir["YaneuraOu_NNUE_halfKPE9-V830Git_APPLEAVX2"]
      end
      if Hardware::CPU.features.include?(:sse4_2)
        prefix.install Dir["YaneuraOu_NNUE_halfKPE9-V830Git_APPLESSE42"]
      end
    end
    if Hardware::CPU.arm?
      prefix.install Dir["YaneuraOu_NNUE_halfKP256-V830Git_APPLEM1"]
    end
  end
end
