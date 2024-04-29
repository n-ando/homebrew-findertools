# Casks/findertools.rb
#
# インストール方法:
#   $ brew tap n-ando/findertools
#   $ brew install --cask findertools
#
# Gatekeeper の警告を避けてインストールする場合:
#   $ brew install --cask --no-quarantine findertools
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

  # Light テーマ
  app "Light Theme/AnyToPDF_light.app"
  app "Light Theme/FinderZIP_light.app"
  app "Light Theme/NewMD_light.app"
  app "Light Theme/NewTerminal_light.app"
  app "Light Theme/NewText_light.app"
  app "Light Theme/NewVSCode_light.app"
  app "Light Theme/Shlink_light.app"

  # Dark テーマ
  app "Dark Theme/AnyToPDF_dark.app"
  app "Dark Theme/FinderZIP_dark.app"
  app "Dark Theme/NewMD_dark.app"
  app "Dark Theme/NewTerminal_dark.app"
  app "Dark Theme/NewText_dark.app"
  app "Dark Theme/NewVSCode_dark.app"
  app "Dark Theme/Shlink_dark.app"

  caveats <<~EOS
    インストール後、各アプリを Cmd を押しながら Finder のツールバーへ
    ドラッグ&ドロップして登録してください。

    このアプリは Apple の公証 (notarization) を受けていないため、初回起動時に
    Gatekeeper にブロックされる場合があります。その場合は
    「システム設定 > プライバシーとセキュリティ」から「このまま開く」を
    選択するか、以下のように quarantine 属性を外して再インストールしてください:

      brew reinstall --cask --no-quarantine findertools
  EOS
end
