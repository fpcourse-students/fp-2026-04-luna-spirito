{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
  };

  outputs = inputs: {
    devShells = builtins.mapAttrs (system: pkgs: {
      default = with pkgs; mkShell {
        packages = [ cabal-install ghc hlint ];
      };
    }) inputs.nixpkgs.legacyPackages;
  };
}
