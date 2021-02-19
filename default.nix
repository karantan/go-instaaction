{
  # Allows CI to override this to an empty directory to determine dependencies
  # Which then can get cached without the source code itself
  buildSrc ? ./.
}:
let
  pkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/tarball/20.09";
    sha256 = "0zi54vbfi6i6i5hdd4v0l144y1c8rg6hq6818jjbbcnm182ygyfa";
  }) { config = {}; overlays = []; };
  inherit (pkgs) lib;

  inherit (import (fetchTarball {
    url = "https://github.com/hercules-ci/gitignore.nix/tarball/7415c4feb127845553943a3856cbc5cb967ee5e0";
    sha256 = "1zd1ylgkndbb5szji32ivfhwh04mr1sbgrnvbrqpmfb67g2g3r9i";
  }) { inherit lib; }) gitignoreSource;

in pkgs.buildGoPackage rec {
  name = "vgo2nix-${version}";
  version = "0.0.1";
  goPackagePath = "instaaction";
  src = gitignoreSource buildSrc;
  goDeps = ./deps.nix;
}
