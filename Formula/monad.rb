class Monad < Formula
  desc "Watches what your machine is playing and logs it as a timeline"
  homepage "https://github.com/leduftw/monad"
  version "2.0.1"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.0.1/monad-macos-arm64.zip"
      sha256 "5aa39d74829f8458b3704695d7c12ddeca43cc9628508f8d2dc9ecbbcef19683"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.0.1/monad-macos-x64.zip"
      sha256 "8bf1c6209fcc4f71c5639dc855602446f9c8ba41a0f85f7b461343b43b518ea8"
    end
  end

  on_linux do
    depends_on "pulseaudio"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.0.1/monad-linux-arm64.tar.gz"
      sha256 "eeadca9e81ca3b5958ace53b30aaba650a1f72143db3854c4c536625520cefa3"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.0.1/monad-linux-x64.tar.gz"
      sha256 "0aee6fbc049ba2cbcb0165a4516008075e8021ea779b4430489a85b54fec54df"
    end
  end

  def install
    odie "Monad requires macOS 14.2 or newer" if OS.mac? && MacOS.version < "14.2"
    bin.install "monad"
    bin.install "monad-audiotap" if OS.mac?
    pkgshare.install "monad.example.json"
    doc.install "LICENSE", "README.md", "THIRD-PARTY-NOTICES.md",
                "DOTNET-LICENSE.txt", "DOTNET-THIRD-PARTY-NOTICES.txt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/monad version")
  end
end
