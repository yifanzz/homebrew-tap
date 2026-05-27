cask "scribe" do
  version "1.0.0"
  sha256 "3048dbd04483d08b9a4edb3c8fdfbe852c515128b773c0f8785ee5f595842ee4"

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
