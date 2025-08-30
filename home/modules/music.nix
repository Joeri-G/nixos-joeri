{ lib, stdenv, fetchurl, dpkg, ... }:

stdenv.mkDerivation rec {
  pname = "deezer-linux";
  version = "1.0";

  src = fetchurl {
    url = "https://github.com/aunetx/deezer-linux/releases/download/v7.0.140/deezer-desktop_7.0.140_amd64.deb";
    sha256 = "sha256-9d2b925bb3bd9ba850c85909cc166fc23feb09daa16f96de0c278d1f1e92d2ac";
  };

  unpackCmd = "dpkg -x $src $out";

  installPhase = ''
    mv $out/usr/* $out/
    substituteInPlace $out/share/applications/Deezer-Linux.desktop --replace /usr/ $out/
  '';

  meta = with lib; {
    description = "Deezer but on Linux!";
    homepage = "https://github.com/aunetx/deezer-linux";
    license = licenses.unfree;
    # maintainers = with maintainers; [ joeri ];
  };
}
