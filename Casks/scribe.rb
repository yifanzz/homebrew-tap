cask "scribe" do
  version "1.0.6"
  sha256 "3f3d137d698c861ed76f32a5faf5750869edd3e0e91ece5d813b65d8e68687b8"

  url "https://github.com/yifanzz/homebrew-tap/releases/download/scribe-v#{version}/Scribe-#{version}.zip",
      verified: "github.com/yifanzz/homebrew-tap/"
  name "Scribe"
  desc "Push-to-talk dictation client for the local Insight Extractor server"
  homepage "https://github.com/yifanzz/homebrew-tap"

  depends_on macos: :tahoe

  app "Scribe.app"

  zap trash: [
    "~/Library/Application Support/co.yifan.scribe",
    "~/Library/Caches/co.yifan.scribe",
    "~/Library/Preferences/co.yifan.scribe.plist",
  ]
end
