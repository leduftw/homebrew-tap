class Dbird < Formula
  desc "Fully playable terminal recreation of the classic Flappy Bird game"
  homepage "https://github.com/leduftw/dbird"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/dbird/releases/download/v#{version}/dbird-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "04de147cbf6ca9fd72ed4212d1990eee246b134a3750dfa2c3b2c7ecfeb97250"
    else
      url "https://github.com/leduftw/dbird/releases/download/v#{version}/dbird-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "002436f730b5e3b41500b3aded619a8b3f62ff0402e5aaa0569b8a266ab02952"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/dbird/releases/download/v#{version}/dbird-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d410b8827ab309da092c02367336a5c5c396b984b144739a113760fd27f8865a"
    else
      url "https://github.com/leduftw/dbird/releases/download/v#{version}/dbird-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "16bca021343661efe5a2527817d438e09108c08a6d47a1536786006abb0e45e6"
    end
  end

  def install
    bin.install "dbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dbird --version")
  end
end
