class Dbird < Formula
  desc "Fully playable terminal recreation of the classic Flappy Bird game"
  homepage "https://github.com/leduftw/dbird"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/dbird/releases/download/v#{version}/dbird-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "94187a82ea3f0910997a3adae08f7bbacc69c3b86ab9c0e0b813ceac7b6b57bd"
    else
      url "https://github.com/leduftw/dbird/releases/download/v#{version}/dbird-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "87f8970daddade79ea06e6e257d40976eeb886915f6c4b1602fe6a299edd75d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leduftw/dbird/releases/download/v#{version}/dbird-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "006bc23fce45f68dec3b6206113180f12697a433ec8643c9d02222a307796d83"
    else
      url "https://github.com/leduftw/dbird/releases/download/v#{version}/dbird-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef82747783f15ef7077d0298a44fe97cfcdd5e3bf98bed50a96977aa899f479a"
    end
  end

  def install
    bin.install "dbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dbird --version")
  end
end
