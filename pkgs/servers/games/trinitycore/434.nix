{ llvmPackages_11, lib, fetchFromGitHub, cmake, libmysqlclient, git, boost, readline, bzip2 }:

llvmPackages_11.stdenv.mkDerivation rec {
  pname = "TrinityCore";
  version = "TDB434.20091";

  src = fetchFromGitHub {
    owner = "The-Cataclysm-Preservation-Project";
    repo = pname;
    rev = version;
    sha256 = "065ihvcf8nil2sgnfrhi9fnlz0m2ni4fl532y21jxjyyzazih4r5";
  };

  nativeBuildInputs = [ cmake git ];
  buildInputs = [ libmysqlclient boost readline bzip2 ];

  cmakeFlags = [
    "-DMYSQL_HOME=${libmysqlclient}/lib/mysql"
    "-DMYSQL_INCLUDE_DIR=${libmysqlclient.dev}/include/mysql"
  ];

  meta = with lib; {
    description = "TrinityCore Open Source MMO Framework";
    homepage = "https://www.trinitycore.org";
    license = licenses.gpl2;
  };
}
