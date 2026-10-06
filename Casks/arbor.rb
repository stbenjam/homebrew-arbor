cask "arbor" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.0"
  sha256 arm:   "ad5f72209941724427984f33f4defb1cf44988a5a0ecacfc1a29cc0ca1934350",
         intel: "f2077b436387e832a1728dedb27572d844580899fdcc5856b13cbe6b6078c5dd"

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
