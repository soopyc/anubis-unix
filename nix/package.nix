{
  lib,
  buildGoModule,

  # custom attrs
  version,
}:

buildGoModule {
  pname = "anubis-unix";
  inherit version;

  src = ../.;

  vendorHash = "sha256-jw/iDhOYxx82sO3o9G5c6HfSpm1hAl6f3y5Y7vbfA7U=";

  ldflags = [
    "-X github.com/soopyc/anubis-unix.Version=${version}"
  ];

  checkFlags = [
    # skip dnsbl test that connects to external services
    "-skip=TestLookup"
  ];

  meta = {
    description = "HTTP connection soul-weighing PoW challenge proxy - forked with UNIX domain socket support";
    homepage = "https://github.com/soopyc/anubis-unix";
    licenses = with lib.licenses; [ mit ];

    maintainers = with lib; [ soopyc ];
    mainProgram = "anubis";
  };
}
