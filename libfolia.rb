class Libfolia < Formula
  desc "XML annotation format for linguistically annotated language resources"
  homepage "https://proycon.github.io/folia/"
  url "http://software.ticc.uvt.nl/libfolia-0.13.tar.gz"
  sha256 "a9111156362d8a68e06132aa7d1a57e28026fad5b90736efdd74f153548c8abd"
  revision 2

  bottle do
    cellar :any
    sha256 "f1001f3278477f88968038d0a722cb851c334653bcf55ca67f599a5482274b5a" => :el_capitan
    sha256 "ed3ce3438a5f10bbae88d8224f672f7968882c5ef822af4650d4db92ac5b9d2f" => :yosemite
    sha256 "4d541070af9aabc2bce4b1a46f3ad9360a7d6e9fc6e5128c074e77ed94d9fd42" => :mavericks
  end

  option "without-test", "skip build-time checks (not recommended)"

  deprecated_option "without-check" => "without_test"

  depends_on "pkg-config" => :build
  depends_on "icu4c"
  depends_on "ticcutils"
  depends_on "libxslt"
  depends_on "libxml2"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "check" if build.with? "test"
    system "make", "install"
  end
end
