cask "scribe" do
  version "1.0.2"
  sha256 "d5b39b079a1cfb24607d0d60ebf159e231e43e7b648d2e74f99bf805b8f0754b"

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
