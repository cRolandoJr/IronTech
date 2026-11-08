{
  description = "IronTech: entorno local para la web y Nginx";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ nginx curl git gnumake zsh markdownlint-cli ];
      };
    };
}
