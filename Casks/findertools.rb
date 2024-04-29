# Casks/findertools.rb
#
# インストール方法:
#   $ brew tap n-ando/findertools
#   $ brew install --cask findertools
#
# インストール先: /Applications/FinderTools/ (14 アプリをまとめて配置)
#
cask "findertools" do
  version "1.0.0"
  sha256 "e9191f796ddb1c38ab3f4c49a90f9adb368fc45ab9064dfac80459400a4a5e34"
  
  url "https://github.com/n-ando/FinderTools/releases/download/v#{version}/FinderTools-v#{version}.dmg"
  name "FinderTools"
  desc "Finder toolbar utility apps (New Text/MD/Terminal/VS Code, ZIP, PDF, symlink)"
  homepage "https://github.com/n-ando/FinderTools"

  livecheck do
    url :url
    strategy :github_latest
  end

  # target を "FinderTools/<app名>" とすることで appdir (通常 /Applications)
  # 直下ではなく /Applications/FinderTools/ 以下に配置する
  app "Light Theme/AnyToPDF_light.app",    target: "FinderTools/AnyToPDF_light.app"
  app "Light Theme/FinderZIP_light.app",   target: "FinderTools/FinderZIP_light.app"
  app "Light Theme/NewMD_light.app",       target: "FinderTools/NewMD_light.app"
  app "Light Theme/NewTerminal_light.app", target: "FinderTools/NewTerminal_light.app"
  app "Light Theme/NewText_light.app",     target: "FinderTools/NewText_light.app"
  app "Light Theme/NewVSCode_light.app",   target: "FinderTools/NewVSCode_light.app"
  app "Light Theme/Shlink_light.app",      target: "FinderTools/Shlink_light.app"

  app "Dark Theme/AnyToPDF_dark.app",      target: "FinderTools_dark/AnyToPDF_dark.app"
  app "Dark Theme/FinderZIP_dark.app",     target: "FinderTools_dark/FinderZIP_dark.app"
  app "Dark Theme/NewMD_dark.app",         target: "FinderTools_dark/NewMD_dark.app"
  app "Dark Theme/NewTerminal_dark.app",   target: "FinderTools_dark/NewTerminal_dark.app"
  app "Dark Theme/NewText_dark.app",       target: "FinderTools_dark/NewText_dark.app"
  app "Dark Theme/NewVSCode_dark.app",     target: "FinderTools_dark/NewVSCode_dark.app"
  app "Dark Theme/Shlink_dark.app",        target: "FinderTools_dark/Shlink_dark.app"

  # 配置後に quarantine 属性を除去 (未公証アプリの Gatekeeper 警告回避)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine",
                          "/Applications/FinderTools",
                          "/Applications/FinderTools_dark"],
                   sudo: false
  end

  # アンインストール時、空になった FinderTools ディレクトリを削除
  uninstall rmdir: [
    "/Applications/FinderTools",
    "/Applications/FinderTools_dark",
  ]

  caveats <<~EOS
    アプリは以下にインストールされます:
      Light テーマ: /Applications/FinderTools/
      Dark  テーマ: /Applications/FinderTools_dark/
    各アプリを Cmd を押しながら Finder のツールバーへドラッグ&ドロップして
    登録してください。

    注意: この cask はインストール時に quarantine 属性を自動的に除去します
    (未公証アプリのため Gatekeeper の初回警告を回避する目的です)。
  EOS
end
