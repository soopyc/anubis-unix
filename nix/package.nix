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

  vendorHash = "sha256-OEYmXqJCq/yUEs3c3yh3tHNB6I2w7smKdCcAPtig+N8=";

  ldflags = [
    "-X github.com/TecharoHQ/anubis.Version=${version}"
  ];

  checkFlags = [
    # skip dnsbl test that connects to external services
    "-skip=TestLookup"
  ];

  meta = {
    description = "HTTP connection soul-weighing PoW challenge proxy";
    homepage = "https://github.com/TecharoHQ/anubis";
    licenses = with lib.licenses; [ mit ];

    maintainers = with lib; [ soopyc ];
    mainProgram = "anubis";
  };
}
