class Arbor < Formula
  desc "Find and delete linked Git worktrees you no longer need"
  homepage "https://github.com/stbenjam/arbor"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stbenjam/arbor/releases/download/v0.4.1/arbor_v0.4.1_darwin_arm64.tar.gz"
      sha256 "4e411b8fc6c5a2f07e888acb249c3448c32fc5169f336559a968f1699b6776cc"
    end

    on_intel do
      url "https://github.com/stbenjam/arbor/releases/download/v0.4.1/arbor_v0.4.1_darwin_amd64.tar.gz"
      sha256 "4db4d68cb03c727b2dab743e2d6712c3aaa1e23409b362a742cdace74bd69df7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stbenjam/arbor/releases/download/v0.4.1/arbor_v0.4.1_linux_arm64.tar.gz"
      sha256 "47425aa6ab348e31b8b3acba099e5b520a29b06ec12425394af5d52786f4502e"
    end

    on_intel do
      url "https://github.com/stbenjam/arbor/releases/download/v0.4.1/arbor_v0.4.1_linux_amd64.tar.gz"
      sha256 "a0287cf61953638570ad60e6f0972be09402ff461b42ebe5f6434f9f83aa4bf5"
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
