class Monad < Formula
  desc "Watches what your machine is playing and logs it as a timeline"
  homepage "https://github.com/leduftw/monad"
  version "2.0.2"
  license "MIT"

  on_macos do
    depends_on macos: :sonoma
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.0.2/monad-macos-arm64.zip"
      sha256 "01c50d03a36201dfb5ce753a4a7f65e02bcecb80da82bc1cc012cd381e52e15d"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.0.2/monad-macos-x64.zip"
      sha256 "6e2ae8c421b03990ce7290af95e5f7c5871712ec26d45946d18275deb574ded8"
    end
  end

  on_linux do
    depends_on "pulseaudio"
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/monad/releases/download/v2.0.2/monad-linux-arm64.tar.gz"
      sha256 "5f906b54ed43101518c06b00b0861335bc7391ead57d89d5b9b76c624cb06d4d"
    else
      url "https://github.com/leduftw/monad/releases/download/v2.0.2/monad-linux-x64.tar.gz"
      sha256 "5d99b82028608fe4e53adbc73e0d32a76a5975346bb2c945aa656f4a7d78aa3e"
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
