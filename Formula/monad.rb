class Monad < Formula
  desc "Watches what your machine is playing and logs it as a timeline"
  homepage "https://github.com/leduftw/monad"
  version "2.2.4"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.2.4/monad-macos-arm64.zip"
      sha256 "a1343e7c19965684139548444c6583e54b818db9b5f7ba2547e78f7e6304177d"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.2.4/monad-macos-x64.zip"
      sha256 "88f73883a6a2e319b95929961289e998d6ad2152fe2e354a20ac57e302aa5e50"
    end
  end

  on_linux do
    depends_on "pulseaudio"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.2.4/monad-linux-arm64.tar.gz"
      sha256 "99569d3f9067bb0575828e1713cc48a88a4f29a412f62714f88fba8258a8219c"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.2.4/monad-linux-x64.tar.gz"
      sha256 "48e161847642ff3fb00c19e7266b14e47e9caf006585706bd097d9449c3ffbdf"
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
