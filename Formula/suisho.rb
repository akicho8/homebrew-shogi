class Suisho < Formula
  desc "弁護士の杉村達也氏が開発し、世界大会で優勝・準優勝の実績がある"
  homepage "https://github.com/yaneurao/YaneuraOu/releases/tag/suisho5" # または https://x.com/tayayan_ts

  url "https://github.com/yaneurao/YaneuraOu/releases/download/suisho5/Suisho5.7z"
  sha256 "6734e3a3d28e67b9206c3442f6d10f16148138327dff811cadedfcf581f79809"

  # TODO: ライセンスがよくわからない
  # license "GPL-3.0-only"

  depends_on "yaneuraou"

  def install
    prefix.install "nn.bin"     # nn とは？
  end

  test do
    assert_predicate prefix/"nn.bin", :exist?, "評価関数が含まれていません"
  end
end
