class Arbor < Formula
  desc "Find and delete linked Git worktrees you no longer need"
  homepage "https://github.com/stbenjam/arbor"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stbenjam/arbor/releases/download/v0.3.0/arbor_v0.3.0_darwin_arm64.tar.gz"
      sha256 "ea8831ba8c0b6e14174a01df720bb6d561d0570955738b5640c95ceb8a07fda8"
    end

    on_intel do
      url "https://github.com/stbenjam/arbor/releases/download/v0.3.0/arbor_v0.3.0_darwin_amd64.tar.gz"
      sha256 "f20fdf7154a24a03a7127d6f0f3c224ef68359c964520d08713aa8cb446dd058"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stbenjam/arbor/releases/download/v0.3.0/arbor_v0.3.0_linux_arm64.tar.gz"
      sha256 "e504323c68bcbb82e4a52f7a157733aea37b690247b23de643fadd34d176d08d"
    end

    on_intel do
      url "https://github.com/stbenjam/arbor/releases/download/v0.3.0/arbor_v0.3.0_linux_amd64.tar.gz"
      sha256 "1a9bcd418accbed14c354fef953682b02e50fa313dee2fe6cb78007cd640466c"
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
