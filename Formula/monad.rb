class Monad < Formula
  desc "Watches what your machine is playing and logs it as a timeline"
  homepage "https://github.com/leduftw/monad"
  version "2.2.2"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.2.2/monad-macos-arm64.zip"
      sha256 "fecbf09efad9ef3d01a53b6525e682c88ad5dac78efede5174bd30569817ca6b"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.2.2/monad-macos-x64.zip"
      sha256 "85a2335f00fe56820c44c4dca40a782cb1edde121b9aa5baba836151f64d7d1c"
    end
  end

  on_linux do
    depends_on "pulseaudio"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.2.2/monad-linux-arm64.tar.gz"
      sha256 "b0321946d35b256a131c6754473d0efa32c5990bfdb98ab9d4074d7a1d74ebeb"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.2.2/monad-linux-x64.tar.gz"
      sha256 "4588083b6881ad63317b4270fb097967d1ecf74371ef6a105078af57ed563713"
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
