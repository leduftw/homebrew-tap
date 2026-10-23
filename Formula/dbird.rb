class Dbird < Formula
  desc "Fully playable terminal recreation of the classic Flappy Bird game"
  homepage "https://github.com/leduftw/dbird"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/dbird/releases/download/v1.4.0/dbird-macos-arm64.zip"
      sha256 "09d871e49655be3076679edc9613b489314c8db0bbd8a012c742ad7036a41cc1"
    else
      url "https://github.com/leduftw/dbird/releases/download/v1.4.0/dbird-macos-x64.zip"
      sha256 "6924d735054fadce6352ec87592d4758d6fcc8e5c281be35b9fed4092a5fc051"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/dbird/releases/download/v1.4.0/dbird-linux-arm64.tar.gz"
      sha256 "69ad522263c4e2df79a75c4bd8676a599630281b1a5766542a1120396033512b"
    else
      url "https://github.com/leduftw/dbird/releases/download/v1.4.0/dbird-linux-x64.tar.gz"
      sha256 "0a129f6e2286c5ebc5da4ace40498a6e0962568e81af583ce2a660a8b7d8f36d"
    end
  end

  def install
    bin.install "dbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dbird --version")
  end
end
