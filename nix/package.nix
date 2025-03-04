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

  vendorHash = "sha256-V/SrgBMZkw9lM+hCM+/5AQKZ3/iTY9kI5Lj+Ch9/Sbc=";

  ldflags = [
    "-X within.website/x.Version=${version}"
  ];

  meta = {
    description = "HTTP connection soul-weighing PoW challenge proxy - forked with ";
    homepage = "https://github.com/Xe/x/blob/master/cmd/anubis/README.md";
    licenses = with lib.licenses; [ cc0 ];

    maintainers = with lib; [ soopyc ];
    mainProgram = "anubis";
  };
}
