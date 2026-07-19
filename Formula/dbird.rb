class Dbird < Formula
  desc "Fully playable terminal recreation of the classic Flappy Bird game"
  homepage "https://github.com/leduftw/dbird"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/dbird/releases/download/v#{version}/dbird-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8197ed70f340093dd77b386bfeaa734b8e3ee9839a2fe3906c73a9d55f78b920"
    else
      url "https://github.com/leduftw/dbird/releases/download/v#{version}/dbird-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a005d3b8b8df1113069622ee8455414b89daa450aa0a85aa1a42140bbb19b5e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/dbird/releases/download/v#{version}/dbird-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "27289845aa25e8091054bfd906de5993760ec09c271a4c8c7200d60039f6aa08"
    else
      url "https://github.com/leduftw/dbird/releases/download/v#{version}/dbird-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ebd98b41fec0e5bfa10bcc49d12248f42a0a8152ddcbd89eaf8a5717f181a05"
    end
  end

  def install
    bin.install "dbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dbird --version")
  end
end
