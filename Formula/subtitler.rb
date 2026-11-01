class Subtitler < Formula
  desc "Subtitles for any video, in any language"
  homepage "https://github.com/leduftw/subtitler"
  version "1.0.2"
  license "MIT"

  on_macos do
    depends_on "ffmpeg"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/subtitler/releases/download/v1.0.2/subtitler-macos-arm64.zip"
      sha256 "7f70134774066dda4fa7735cf4f308bb0bb9b7017ddcec3148da36a9f536e792"
    else
      url "https://github.com/leduftw/subtitler/releases/download/v1.0.2/subtitler-macos-x64.zip"
      sha256 "35ed0bd6d9d6cecae27b7c2cf253fbc1c14e2a582ac2d84fb96aeeeff63f7e87"
    end
  end

  on_linux do
    depends_on "ffmpeg"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/subtitler/releases/download/v1.0.2/subtitler-linux-arm64.tar.gz"
      sha256 "8f16584b3aff9fe2c9fc61b5874db9543df313fc03681f5e80f4e2fae78e6e4a"
    else
      url "https://github.com/leduftw/subtitler/releases/download/v1.0.2/subtitler-linux-x64.tar.gz"
      sha256 "8b1f34a8fb1baef639bf7229a6055b118f905cd669a803a4b29fe8bd84758d18"
    end
  end

  def install
    libexec.install "subtitler", "subtitler-runtime-1.0.2"
    bin.install_symlink libexec/"subtitler"
    doc.install "LICENSE", "README.md", "PYTHON-LICENSE.txt", "PYTHON-THIRD-PARTY-NOTICES.txt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/subtitler --version")
  end
end
