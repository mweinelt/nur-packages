{ pkgs, system, dataDir ? "/opt/zigbee2mqtt/data", nixosTests }:
let
  package = (import ./node.nix { inherit pkgs system; }).package;
in
package.override rec {
  version = "1.18.3";
  reconstructLock = true;

  src = pkgs.fetchFromGitHub {
    owner = "Koenkk";
    repo = "zigbee2mqtt";
    rev = version;
    sha256 = "sha256-OjL6tzGxpnbkuXU3Yr/HmT+8SVgk16HlpD10maGB+UA=";
  };

  passthru.tests.zigbee2mqtt = nixosTests.zigbee2mqtt;

  meta = with pkgs.lib; {
    description = "Zigbee to MQTT bridge using zigbee-shepherd";
    license = licenses.gpl3;
    homepage = https://github.com/Koenkk/zigbee2mqtt;
    maintainers = with maintainers; [ hexa ];
    platforms = platforms.linux;
  };
}