{
  system ? builtins.currentSystem,
  pkgs ? import <nixpkgs> { inherit system; },
}:
pkgs.callPackage ./nix/package.nix {
  version = (pkgs.lib.trim (builtins.readFile ./VERSION)) + "-unstable-2025-03-22";
}
