class Wopr < Formula
  homepage "http://ilk.uvt.nl/wopr"
  url "http://software.ticc.uvt.nl/wopr-1.36.1.tar.gz"
  sha256 "ffcf2ce85f18dcce86a45ecdd9f3066e4c1f8043b8b33bf4bc71bfe91ae32e49"

  depends_on "pkg-config" => :build
  depends_on "timbl"
  depends_on "libfolia"

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
