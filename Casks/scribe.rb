cask "scribe" do
  version "1.0.4"
  sha256 "14c66c12cef5ec8b6ff479e3d6a64a0fd6b62393326ac734c557fd159ccf0629"

  url "https://github.com/yifanzz/homebrew-tap/releases/download/scribe-v#{version}/Scribe-#{version}.zip",
      verified: "github.com/yifanzz/homebrew-tap/"
  name "Scribe"
  desc "Push-to-talk dictation client for the local Insight Extractor transcription server"
  homepage "https://github.com/yifanzz/homebrew-tap"

  app "Scribe.app"

  zap trash: [
    "~/Library/Application Support/co.yifan.scribe",
    "~/Library/Caches/co.yifan.scribe",
    "~/Library/Preferences/co.yifan.scribe.plist",
  ]
end
