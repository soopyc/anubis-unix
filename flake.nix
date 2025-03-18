{
  description = "Anubis";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      self,
      nixpkgs,
      treefmt-nix,
      ...
    }:
    let
      lib = nixpkgs.lib;

      supportedSystems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = fn: lib.genAttrs supportedSystems (system: fn nixpkgs.legacyPackages.${system});

      treefmtEval = forAllSystems (pkgs: treefmt-nix.lib.evalModule pkgs ./nix/treefmt.nix);
    in
    {

      packages = forAllSystems (pkgs: {
        default =
          lib.warn
            "anubis-unix: this flake is deprecated since related functionality was upstreamed and released in anubis v1.14.0, and a nixpkgs PR has been created; this will soon throw an error once the package is merged in nixos-unstable."
            pkgs.callPackage
            ./default.nix
            { };
      });

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            go
            gopls
            gotools
            go-tools
          ];
        };
      });

      formatter = forAllSystems (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);
      checks = forAllSystems (pkgs: {
        formatting = treefmtEval.${pkgs.system}.config.build.check self;
        package = self.packages.${pkgs.system}.default;
      });
    };
}
