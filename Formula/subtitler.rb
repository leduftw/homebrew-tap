class Subtitler < Formula
  desc "Subtitles for any video, in any language"
  homepage "https://github.com/leduftw/subtitler"
  version "1.0.0"
  license "MIT"

  on_macos do
    depends_on "ffmpeg"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/subtitler/releases/download/v1.0.0/subtitler-macos-arm64.zip"
      sha256 "1c1e1ce9216a9e0cd45dd5b18fbd709f76e79aa60c6e8005609bc2a760a8b034"
    else
      url "https://github.com/leduftw/subtitler/releases/download/v1.0.0/subtitler-macos-x64.zip"
      sha256 "8e1cd8db0a859ee2866df9a1399f3dad95b8d142ed71c32c2ce76a312fdc44ae"
    end
  end

  on_linux do
    depends_on "ffmpeg"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/subtitler/releases/download/v1.0.0/subtitler-linux-arm64.tar.gz"
      sha256 "53da8d6ef86fe1680fac3bfc247fd55f724cb9ca9b46b6a7db190b2675e42740"
    else
      url "https://github.com/leduftw/subtitler/releases/download/v1.0.0/subtitler-linux-x64.tar.gz"
      sha256 "1234d09410ce6e854b536160ef054526d4d3759ad21c24cb4189c3fa72f4cced"
    end
  end

  def install
    bin.install "subtitler"
    doc.install "LICENSE", "README.md", "PYTHON-LICENSE.txt", "PYTHON-THIRD-PARTY-NOTICES.txt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/subtitler --version")
  end
end
