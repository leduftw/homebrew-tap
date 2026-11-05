class Monad < Formula
  desc "Watches what your machine is playing and logs it as a timeline"
  homepage "https://github.com/leduftw/monad"
  version "2.2.3"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.2.3/monad-macos-arm64.zip"
      sha256 "67f95fd292a864c43e548b87f7fe7124ba51e69d299967b6a669b44576890649"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.2.3/monad-macos-x64.zip"
      sha256 "b6ddb4f31645c608105f3bbb522001c247fc0a2323f701b9d3ea8b1c3f7b77cb"
    end
  end

  on_linux do
    depends_on "pulseaudio"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.2.3/monad-linux-arm64.tar.gz"
      sha256 "e65c9e49468af5b62055c155d1ca471258c3cd53f9ef1d7b73a686c1f2b16384"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.2.3/monad-linux-x64.tar.gz"
      sha256 "4a4a78ae68f70e93e3afcc104ff01f738bebf8bca8a0a0e728cb10d3444f222e"
    end
  end

  def install
    odie "monad needs macOS 14.2 or newer" if OS.mac? && MacOS.version < "14.2"
    bin.install "monad"
    bin.install "monad-audiotap" if OS.mac?
    pkgshare.install "monad.example.json"
    doc.install "LICENSE", "README.md", "THIRD-PARTY-NOTICES.md", "DOTNET-LICENSE.txt", "DOTNET-THIRD-PARTY-NOTICES.txt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/monad version")
  end
end
