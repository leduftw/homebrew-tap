class Monad < Formula
  desc "Watches what your machine is playing and logs it as a timeline"
  homepage "https://github.com/leduftw/monad"
  version "2.2.0"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.2.0/monad-macos-arm64.zip"
      sha256 "e949f95bbbc9facfeb096796d0da39d6be75a23350138897eade39910489a528"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.2.0/monad-macos-x64.zip"
      sha256 "441d8e0fd10a52fe4bd23c4955362fad498382a68352800b1b8b922c68c34779"
    end
  end

  on_linux do
    depends_on "pulseaudio"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.2.0/monad-linux-arm64.tar.gz"
      sha256 "3d9f3f9a717bb6ffd21c5ab09c1063bf6b3b059c62b4b54019a7ff5d7e0a7d62"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.2.0/monad-linux-x64.tar.gz"
      sha256 "b3242810114508d588a855349eed61fadbbe3ba07d60323443ead668778c466c"
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
