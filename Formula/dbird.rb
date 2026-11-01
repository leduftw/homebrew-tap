class Dbird < Formula
  desc "Fully playable terminal recreation of the classic Flappy Bird game"
  homepage "https://github.com/leduftw/dbird"
  version "1.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/dbird/releases/download/v1.4.1/dbird-macos-arm64.zip"
      sha256 "29cfa7ea04ba3014b0c8c2dedd914951662700fe41f1a6cec4d187f2442a1aa4"
    else
      url "https://github.com/leduftw/dbird/releases/download/v1.4.1/dbird-macos-x64.zip"
      sha256 "bddb5b314d334e3cebc4910a4108559a16bb6ca5d0278be5da93628806b4ce0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/dbird/releases/download/v1.4.1/dbird-linux-arm64.tar.gz"
      sha256 "4379e864d6798d2bc2fc402404878d94a1bbfb9a6d997da6f565bf4fcef65242"
    else
      url "https://github.com/leduftw/dbird/releases/download/v1.4.1/dbird-linux-x64.tar.gz"
      sha256 "de9789dc374e34ec3c8f9dd1e5deb5756cb87b4c113c68d38fa963994cd3ce04"
    end
  end

  def install
    bin.install "dbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dbird --version")
  end
end
