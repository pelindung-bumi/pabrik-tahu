{
  description = "Pabrik Tahu — IaC with OpenTofu";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    systems.url = "github:nix-systems/default";
  };

  outputs = { self, nixpkgs, systems, ... }:
    let
      lib = nixpkgs.lib;
      forEachSystem = lib.genAttrs (import systems);
      mkPkgs = system: import nixpkgs { inherit system; config.allowUnfree = true; };
    in
    {
      formatter = forEachSystem (system: (mkPkgs system).nixfmt-rfc-style);

      devShells = forEachSystem (system:
        let
          pkgs = mkPkgs system;
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              git
              just
              opentofu
              nixfmt-rfc-style
            ];

            shellHook = ''
              echo "Pabrik Tahu dev environment"
              echo "OpenTofu $(tofu --version | head -1)"
            '';
          };
        });
    };
}
