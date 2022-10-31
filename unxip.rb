class Unxip < Formula
  desc "A fast Xcode unarchiver"
  homepage "https://github.com/saagarjha/unxip"
  url "https://github.com/saagarjha/unxip.git",
      tag:      "v1.1.2",
      revision: "b0dbc9b29c8656aa1cd388d337283064c641251c"
  license "LGPL-3.0"
  version_scheme 1
  head "https://github.com/saagarjha/unxip.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on macos: :monterey
  uses_from_macos "swift"

  def install
    system "swiftc", "-O", "-parse-as-library", "unxip.swift"
    bin.install "unxip"
  end

  test do
    system "#{bin}/unxip", "--help"
  end
end
