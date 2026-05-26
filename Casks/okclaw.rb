cask "okclaw" do
  version "0.0.1"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/yifanzz/okclaw/releases/download/v#{version}/OkClaw-#{version}.zip",
      verified: "github.com/yifanzz/okclaw/"
  name "OkClaw"
  desc "Voice-controlled Claude Code companion"
  homepage "https://github.com/yifanzz/okclaw"

  app "OkClaw.app"

  zap trash: [
    "~/Library/Application Support/co.yifan.ok-claw",
    "~/Library/Caches/co.yifan.ok-claw",
    "~/Library/Preferences/co.yifan.ok-claw.plist",
  ]
end
