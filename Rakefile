require "pathname"

task :install do
  sh <<~EOT
  brew tap akicho8/shogi
  brew install --cask shogi-home
  EOT
end

task :uninstall do
  sh <<~EOT
  brew rm --cask shogi-home
  brew rm suisho
  brew rm yaneuraou
  brew untap akicho8/shogi
  true
  EOT
end

task :destroy_all => :uninstall do
  Pathname("~/Library/Application Support/electron-shogi/usi_engine.json").expand_path.delete rescue nil
  # Pathname("~/Library/Application Support/electron-shogi").expand_path.rmtree
end

task :update do
  sh <<~EOT
  brew update && brew upgrade shogi-home
  EOT
end

task :check do
  system <<~EOT
  ls -al /opt/homebrew/Library/Taps/akicho8/homebrew-shogi
  ls -al /opt/homebrew/Caskroom/shogi-home
  ls -al /opt/homebrew/opt/yaneuraou/YaneuraOu_NNUE_halfKP256-V830Git_APPLEM1
  ls -al ~/Library/Application\\ Support/electron-shogi/usi_engine.json
  ls -al /Applications/ShogiHome.app/Contents/MacOS/ShogiHome
  EOT
end

task :default => "test:install"

namespace :test do
  task :install => :destroy_all do
    sh <<~EOT
    git now
    brew tap akicho8/shogi ~/src/homebrew-shogi
    brew install --cask shogi-home
    EOT
  end

  task :resintall do
    sh <<~EOT
    brew reinstall shogi-home
    EOT
  end
end
