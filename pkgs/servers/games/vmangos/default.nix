{ lib
, stdenv
, fetchFromGitHub
, cmake
, ace
, git
, libmysqlclient
, openssl
, tbb
}:

stdenv.mkDerivation rec {
  pname = "vmangos";
  version = "unstable-2020-11-30";

  src = fetchFromGitHub {
    owner = "vmangos";
    repo = "core";
    rev = "fdd11c710552a3c64e0acf7aba25bddd11fed64c";
    sha256 = "0jqrs0gkimfv03lrmhkfp7vkwqrbc6zbas5lmd6204mpwfh3cqfp";
  };

  nativeBuildInputs = [ cmake git ];
  buildInputs = [ ace libmysqlclient openssl.dev tbb ];

  cmakeFlags = [
    "-DMYSQL_HOME=${libmysqlclient}/lib/mysql"
    "-DMYSQL_INCLUDE_DIR=${libmysqlclient.dev}/include/mysql"
    "-DOPENSSL_LIBRARIES_DIR=${openssl}/lib/openssl"
    "-DOPENSSL_INCLUDE_DIR=${openssl.dev}/include/openssl"
    "-DUSE_LIBCURL=1"
    "-DUSE_EXTRACTORS=1"
  ];

  meta = with lib; {
    description = "Progressive Vanilla Core aimed at all versions from 1.2 to 1.12";
    homepage = "https://github.com/vmangos/core";
    licenses = license.gpl2;
  };
}
