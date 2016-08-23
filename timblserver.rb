class Timblserver < Formula
  homepage "http://ilk.uvt.nl/timbl/"
  url "http://software.ticc.uvt.nl/timblserver-1.10.tar.gz"
  sha256 "81f31aac8bc7d5ae7f12a6f3fcd19507d688451be2cc63ce79f780375029e02e"

  depends_on "pkg-config" => :build
  depends_on "timbl"
  depends_on "ticcutils"

  option "without-check", "skip build-time checks (not recommended)"

  needs :openmp

  def install
    ENV["LD"] = ENV.cc
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "check" if build.with? "check"
    system "make", "install"
  end
end
