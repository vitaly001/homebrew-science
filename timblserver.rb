require "formula"


class Timblserver < Formula
  homepage "http://ilk.uvt.nl/timbl/"
  url "http://software.ticc.uvt.nl/timblserver-1.9.tar.gz"
  sha1 "d905034f48d28d3f9bf870021c4389ba3822d4ba"

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
