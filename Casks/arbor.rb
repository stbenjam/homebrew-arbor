cask "arbor" do
  arch arm: "arm64", intel: "amd64"

  version "0.4.0"
  sha256 arm:   "c889b7045f893c3b72ce0ee5dce2b2c31add4b0f8699879c4bc744ee88f9a2b9",
         intel: "1f2caabc155363f27d1b1114c9e1062f8a2f0950985f2d3c1203bbd9c8636455"

  url "https://github.com/stbenjam/arbor/releases/download/v#{version}/arbor_v#{version}_darwin_#{arch}.app.zip"
  name "Arbor"
  desc "Find and delete linked Git worktrees you no longer need"
  homepage "https://github.com/stbenjam/arbor"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Arbor.app"

  zap trash: [
    "~/Library/Application Support/Arbor",
    "~/Library/Application Support/arbor/statistics.json",
    "~/Library/Preferences/io.github.stbenjam.arbor.plist",
    "~/Library/Saved Application State/io.github.stbenjam.arbor.savedState",
  ]

  caveats <<~EOS
    Arbor is ad-hoc signed, but not yet signed with an Apple Developer ID
    or notarized. macOS will refuse to open it the first time. After trying
    to open it, go to System Settings → Privacy & Security → Open Anyway.
    Only approve a download you trust.
  EOS
end
