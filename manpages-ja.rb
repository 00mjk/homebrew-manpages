class ManpagesJa < Formula
  desc "Japanese manpages, translated by JM Project"
  homepage "https://linuxjm.osdn.jp"
  head "https://github.com/reishoku/manpages-ja.git", branch: "main"

  # This formula depends on "man", but the command exist both on macOS and Linux (distros).
  depends_on "man-db"
  on_macos do
    depends_on "coreutils"
    depends_on "findutils"
    depends_on "expect"
  end

  conflicts_with "manpages-ja-coreutils", "manpages-ja-findutils", "manpages-ja-expect",
    because: "manpages-ja is metapackage"

  def install
    prefix.install Dir["coreutils"]
    prefix.install Dir["findutils"]
    prefix.install Dir["expect"]
  end

  def caveats
    <<~EOS
      In order to use manpages-ja, you should manually modify MANPATH environmental variable.
      To acquire the list, simply run (bash):

        gfind $(brew --prefix manpages-ja)/*/share/man -maxdepth 0 -type d
    EOS
  end
end
