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
    share.install Dir["coreutils/share/*"]
    share.install Dir["findutils/share/*"]
    share.install Dir["expect/share/*"]
  end

  def caveats
    <<~EOS
      Make sure you add the following directory to your MANPATH:

        echo MANPATH="$(brew --prefix)/share/man:${MANPATH}" | tee -a ~/.bashrc
    EOS
  end
end
