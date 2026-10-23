class Monad < Formula
  desc "Watches what your machine is playing and logs it as a timeline"
  homepage "https://github.com/leduftw/monad"
  version "2.1.0"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.1.0/monad-macos-arm64.zip"
      sha256 "f5a1c095f6ce09d80815f108fc95c22e49b6d8f8c1716d88d032fdd26ca6c329"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.1.0/monad-macos-x64.zip"
      sha256 "b405a7a2b55bdf87c2f274cec591da257b8063e369b8fbdc52726fe661124c57"
    end
  end

  on_linux do
    depends_on "pulseaudio"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.1.0/monad-linux-arm64.tar.gz"
      sha256 "aada14c293fc514c354ed25cc7f078f9ad1c366e7f940d379c5aa11a2af287a0"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.1.0/monad-linux-x64.tar.gz"
      sha256 "7c646766b7e66df01b6e7c9d3c160e0795dbcd5b931d6d3f7dcd5568307c2593"
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
