cask "scribe" do
  version "1.0.5"
  sha256 "7647bb2db6751765fa17fed94e7366fb1ffa0c7382211d9c913b0246ac4f34ac"

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
