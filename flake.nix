{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  outputs = { self, nixpkgs }:
    let
      supportedSystems =
        [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      f = system:
        let
          pkgs = import nixpkgs { inherit system; };
          haskell = (pkgs.haskellPackages.ghcWithPackages
            (ps: with ps; [ haskell-language-server hlint stylish-haskell ]));
        in {
          devShell.${system} = pkgs.mkShell {
            buildInputs = [ haskell ];
            shellHook = ''
              eval $(egrep ^export ${haskell}/bin/ghc)
            '';
          };
        };
    in nixpkgs.lib.foldr nixpkgs.lib.mergeAttrs { } (map f supportedSystems);
}
