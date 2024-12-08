class Suisho < Formula
  version "5"
  sha256 "6734e3a3d28e67b9206c3442f6d10f16148138327dff811cadedfcf581f79809"
  url "https://github.com/yaneurao/YaneuraOu/releases/download/suisho5/Suisho5.7z"

  depends_on "yaneuraou"

  def install
    prefix.install Dir["*"]
  end
end
