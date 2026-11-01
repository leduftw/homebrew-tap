class Subtitler < Formula
  desc "Subtitles for any video, in any language"
  homepage "https://github.com/leduftw/subtitler"
  version "1.0.1"
  license "MIT"

  on_macos do
    depends_on "ffmpeg"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/subtitler/releases/download/v1.0.1/subtitler-macos-arm64.zip"
      sha256 "9276ec2c1e6567474af09beb249adb2f5b2c63f559df1231297a7c431f22ce29"
    else
      url "https://github.com/leduftw/subtitler/releases/download/v1.0.1/subtitler-macos-x64.zip"
      sha256 "1a6efde4b2bcac45f5c6d467e2737e05c69e464619e1b5d080058a01f9aef20a"
    end
  end

  on_linux do
    depends_on "ffmpeg"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/subtitler/releases/download/v1.0.1/subtitler-linux-arm64.tar.gz"
      sha256 "4b20720c6bde1f9fa5335688c568d3bbe4933398aa62efb96d4d68d7d0dbd29d"
    else
      url "https://github.com/leduftw/subtitler/releases/download/v1.0.1/subtitler-linux-x64.tar.gz"
      sha256 "1fddf1edcb21d16241cd41b59cf517eac73607ed667a3670cbddd9dc62e8b3de"
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
