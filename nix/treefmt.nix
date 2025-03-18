{ ... }:
{
  projectRootFile = "flake.nix";
  programs.nixfmt.enable = true;
  settings.global.excludes = [
    "*.go"
    "static/*"
  ];
}
