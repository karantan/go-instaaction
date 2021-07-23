{ buildGoModule
, nix-gitignore
}:

buildGoModule {
  pname = "instaaction";
  version = "0.0.1";

  src = nix-gitignore.gitignoreSource [] ./.;
  goPackagePath = "instaaction";
  # The checksum of the Go module dependencies. `modSha256` will change if go.mod changes.
  modSha256 = "...";
}
