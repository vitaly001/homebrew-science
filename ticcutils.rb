class Ticcutils < Formula
  desc "Tools for the TiCC Software Stack"
  homepage "http://ilk.uvt.nl/ticcutils/"
  url "http://software.ticc.uvt.nl/ticcutils-0.11.tar.gz"
  sha256 "0cd6507d79e637dfa6896cd624b3381e57c7430063654109fda354c8af0a9b5e"

  bottle do
    cellar :any
    sha256 "ab116db5f7cc8455f1c5d9bd0034577d6eccd9f9133ba418e4a21c6cb795242f" => :el_capitan
    sha256 "1c71bee71cf797698a4df8f1041a02f7e8e20af3dda77efedc0c4cf6790b21c3" => :yosemite
    sha256 "eea831350727ba0a45381dba98aaae0afea8777c56cb144f52e10c5f3ed85842" => :mavericks
  end

  depends_on "pkg-config" => :build

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
