cask "okclaw" do
  version "1.0.24"
  sha256 "a64f642834e8cb835c0da06af5cb4dc43abc1803f79ec35a91c0ee5fe12a0753"

  url "https://github.com/yifanzz/homebrew-tap/releases/download/okclaw-v#{version}/OkClaw-#{version}.zip",
      verified: "github.com/yifanzz/homebrew-tap/"
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
