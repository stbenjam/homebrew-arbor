cask "arbor" do
  arch arm: "arm64", intel: "amd64"

  version "0.4.1"
  sha256 arm:   "682ef82bffbffc2abc7bd54971e0a52a942d864f45561b9c0827309f26092288",
         intel: "7376cc173ce541ab90965a6f4448e2622ab1f19a5ec9f878bc08c559f5400bf6"

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
