cask "scribe" do
  version "0.1.0"
  sha256 "1f14e1f3f83eb406671789a8e18fdfac7a4976107760fc9eb5d642487e69ba03"

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
