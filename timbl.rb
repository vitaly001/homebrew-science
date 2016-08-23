class Timbl < Formula
  desc "Memory-based learning algorithms"
  homepage "http://ilk.uvt.nl/timbl/"
  url "http://software.ticc.uvt.nl/timbl-6.4.7.tar.gz"
  sha256 "225db24aef6f093a2b1c3806acbc4df98a8880a55e9069e51ad4319e26029945"

  bottle do
    cellar :any
    sha256 "f96e343829eaa220579f120bbde601c6340400ffede6147774fc3eb10220eb14" => :el_capitan
    sha256 "bd9de88b4a642f4a31b5536b49f77a5dfa4401f7ad90a5a5fd83d90c42541930" => :yosemite
    sha256 "46c6b0f12e0d97088884abf54007b7ea70adff1a87038756a2285bc1a55e061e" => :mavericks
  end

  depends_on "pkg-config" => :build
  depends_on "libxml2"
  depends_on "ticcutils"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
