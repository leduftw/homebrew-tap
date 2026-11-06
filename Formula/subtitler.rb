class Subtitler < Formula
  desc "Subtitles for any video, in any language"
  homepage "https://github.com/leduftw/subtitler"
  version "1.1.0"
  license "MIT"

  on_macos do
    depends_on "ffmpeg"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/subtitler/releases/download/v1.1.0/subtitler-macos-arm64.zip"
      sha256 "394e11e08b2d22c295dd42801b4a654c30c562494651f944924ae1dbf23f7fba"
    else
      url "https://github.com/leduftw/subtitler/releases/download/v1.1.0/subtitler-macos-x64.zip"
      sha256 "e6f3024d8063e9531882137f79bf26548f650ca61c13efb82d5483b995dd41e6"
    end
  end

  on_linux do
    depends_on "ffmpeg"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/subtitler/releases/download/v1.1.0/subtitler-linux-arm64.tar.gz"
      sha256 "2b52eabd9b0c0e426279a8ab69a8fc2ee925b7ac6d7edc3359d2df440ffa3801"
    else
      url "https://github.com/leduftw/subtitler/releases/download/v1.1.0/subtitler-linux-x64.tar.gz"
      sha256 "22904116ca92022585681a96304f8a8922eef1ffb09041c7a674eb7f7d4d4241"
    end
  end

  def install
    libexec.install "subtitler", "subtitler-runtime-1.1.0"
    bin.install_symlink libexec/"subtitler"
    doc.install "LICENSE", "README.md", "PYTHON-LICENSE.txt", "PYTHON-THIRD-PARTY-NOTICES.txt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/subtitler --version")
  end
end
