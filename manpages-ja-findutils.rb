class ManpagesJaFindutils < Formula
  desc "Japanese manpages of GNU findutils, translated by JM Project"
  homepage "https://linuxjm.osdn.jp"
  head "https://github.com/reishoku/manpages-ja-findutils.git", branch: "main"

  on_macos do
    depends_on "findutils"
  end

  def install
    share.install Dir["share/*"]
  end

  def caveats
    <<~EOS
      Make sure you add the following directory to your MANPATH and set correct locale:

        $ echo MANPATH="$(brew --prefix)/share/man:${MANPATH}" | tee -a ~/.bashrc
    EOS
  end
end
