{ llvmPackages_11, lib, fetchFromGitHub, cmake, libmysqlclient, git, boost, readline, bzip2 }:

llvmPackages_11.stdenv.mkDerivation rec {
  pname = "TrinityCore";
  version = "TDB335.20101";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = version;
    sha256 = "1pciyvvcbf9dxwd368807m9pvii6lnpfpjpy41m79xvmwdqjsajf";
  };

  nativeBuildInputs = [ cmake git ];
  buildInputs = [ libmysqlclient boost readline bzip2 ];

  meta = with lib; {
    description = "TrinityCore Open Source MMO Framework";
    homepage = "https://www.trinitycore.org";
    license = licenses.gpl2;
  };
}
