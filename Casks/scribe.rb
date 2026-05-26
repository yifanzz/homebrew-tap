cask "scribe" do
  version "0.0.1"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/yifanzz/scribe/releases/download/v#{version}/Scribe-#{version}.zip",
      verified: "github.com/yifanzz/scribe/"
  name "Scribe"
  desc "Audio capture and insight extraction"
  homepage "https://github.com/yifanzz/scribe"

  app "Scribe.app"

  zap trash: [
    "~/Library/Application Support/co.yifan.scribe",
    "~/Library/Caches/co.yifan.scribe",
    "~/Library/Preferences/co.yifan.scribe.plist",
  ]
end
