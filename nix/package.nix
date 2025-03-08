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

  vendorHash = "sha256-DGWgD9weX/JWPPr7RDiK5J5uu81kRANfmlql4/KB9ro=";

  ldflags = [
    "-X within.website/x.Version=${version}"
  ];

  checkFlags = [
    # skip dnsbl test that connects to external services
    "-skip=TestLookup"
  ];

  meta = {
    description = "HTTP connection soul-weighing PoW challenge proxy - forked with ";
    homepage = "https://github.com/Xe/x/blob/master/cmd/anubis/README.md";
    licenses = with lib.licenses; [ cc0 ];

    maintainers = with lib; [ soopyc ];
    mainProgram = "anubis-unix";
  };
}
