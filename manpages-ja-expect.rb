class ManpagesJaExpect < Formula
  desc "Japanese manpages of GNU expect, translated by JM Project"
  homepage "https://linuxjm.osdn.jp"
  head "https://github.com/reishoku/manpages-ja-expect.git", branch: "main"

  # This formula depends on "man", but the command exist both on macOS and Linux (distros).
  depends_on "man-db"
  on_macos do
    depends_on "expect"
  end

  def install
    share.install Dir["share/*"]
  end

  def caveats
    <<~EOS
      Make sure you add the following directory to your MANPATH:

        echo MANPATH="$(brew --prefix)/share/man:${MANPATH}" | tee -a ~/.bashrc
    EOS
  end
end
