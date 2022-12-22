{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {
    packages.x86_64-darwin.default =
      let pkgs = import nixpkgs { system = "x86_64-darwin"; };
      in pkgs.buildGoModule rec {
        pname = "instaaction";
        version = "1.0.0";

        src = pkgs.nix-gitignore.gitignoreSource [ ] ./.;
        # The checksum of the Go module dependencies. `vendorSha256` will change if go.sum changes.
        # If you don't know the hash, the first time, set:
        # sha256 = "0000000000000000000000000000000000000000000000000000";
        # then nix will fail the build with such an error message:
        # hash mismatch in fixed-output derivation '/nix/store/m1ga09c0z1a6n7rj8ky3s31dpgalsn0n-source':
        # wanted: sha256:0000000000000000000000000000000000000000000000000000
        # got:    sha256:173gxk0ymiw94glyjzjizp8bv8g72gwkjhacigd1an09jshdrjb4
        vendorSha256 = "17h0wlfyizjl7pyf218748nr29ik75hzijgy45grd9fwl4aacppd";
        ldflags = "-X instaaction/version.Version=${version}";
      };
  };
}
