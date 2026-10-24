class Monad < Formula
  desc "Watches what your machine is playing and logs it as a timeline"
  homepage "https://github.com/leduftw/monad"
  version "2.2.1"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.2.1/monad-macos-arm64.zip"
      sha256 "70eef724b84b0102383e2ec402e5d8b6fa30f3dc953979bf6de4881e1449dd52"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.2.1/monad-macos-x64.zip"
      sha256 "a3c6a1f2938d993b26008dfb70bff2857ee12ace5c7b606e8c74f172af7be679"
    end
  end

  on_linux do
    depends_on "pulseaudio"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.2.1/monad-linux-arm64.tar.gz"
      sha256 "c821415f83d659608071fc6b98253229ffb4d08c58baaef0055a8ae9945bcfad"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.2.1/monad-linux-x64.tar.gz"
      sha256 "598ede0432b35ee9b9618647e749e22f742cdf9cc09a14df549eb026147d6641"
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
