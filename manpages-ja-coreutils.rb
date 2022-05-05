class ManpagesJaCoreutils < Formula
  desc "Japanese manpages of GNU coreutils, translated by JM Project"
  homepage "https://linuxjm.osdn.jp"
  head "https://github.com/reishoku/manpages-ja-coreutils.git"

  # This formula depends on "man", but the command exist both on macOS and Linux (distros).

  def install
    share.install Dir["share/*"]
  end
end
