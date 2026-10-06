class Arbor < Formula
  desc "Find and delete linked Git worktrees you no longer need"
  homepage "https://github.com/stbenjam/arbor"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stbenjam/arbor/releases/download/v0.4.0/arbor_v0.4.0_darwin_arm64.tar.gz"
      sha256 "e90bfb0c0d5352ac2f9d1e6dd162300d5a9aec228dc61819c3eadc570d52a1af"
    end

    on_intel do
      url "https://github.com/stbenjam/arbor/releases/download/v0.4.0/arbor_v0.4.0_darwin_amd64.tar.gz"
      sha256 "ab0db777050b3bbf8a2d6694e8b8952717e0eba5acb78960e59fb183e300bc18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stbenjam/arbor/releases/download/v0.4.0/arbor_v0.4.0_linux_arm64.tar.gz"
      sha256 "43dfb52eaf48f8412bbdeb15c2437c756d48223773a70897903cce00fac79edc"
    end

    on_intel do
      url "https://github.com/stbenjam/arbor/releases/download/v0.4.0/arbor_v0.4.0_linux_amd64.tar.gz"
      sha256 "5f42c23b9d60e640953e9287809a7feb6dc5308c887127119c94c53736819315"
    end
  end

  def install
    bin.install "arbor"
    generate_completions_from_executable(bin/"arbor", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arbor version")
    (testpath/"empty").mkpath
    system bin/"arbor", "list", "--path", testpath/"empty", "--json"
  end
end
