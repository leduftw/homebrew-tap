class Dbird < Formula
  desc "Fully playable terminal recreation of the classic Flappy Bird game"
  homepage "https://github.com/leduftw/dbird"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/dbird/releases/download/v1.3.0/dbird-macos-arm64.zip"
      sha256 "c401a6646b5ef0c162caa076d0793cbafcfbe7f81380c097bc0271244f0cfe8f"
    else
      url "https://github.com/leduftw/dbird/releases/download/v1.3.0/dbird-macos-x64.zip"
      sha256 "761f9d9c0609ba7f325d4ce0f09f2ed0f090d9e61a5863c79821acca867d963f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/dbird/releases/download/v1.3.0/dbird-linux-arm64.tar.gz"
      sha256 "06bc4cf0e28fd79b36b65081f74b9688234ba805e62fe96b3fb6e0bff27f5d1c"
    else
      url "https://github.com/leduftw/dbird/releases/download/v1.3.0/dbird-linux-x64.tar.gz"
      sha256 "6fc5b5643f44a3949790097195c705c91869905324b75397a2ed3f8cffc5fee6"
    end
  end

  def install
    bin.install "dbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dbird --version")
  end
end
