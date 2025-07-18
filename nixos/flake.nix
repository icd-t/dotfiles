# /etc/nixos/flake.nix
{
  description = "NixOS configuration";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
    musnix  = { url = "github:musnix/musnix"; };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs: rec {
    nixosConfigurations = {
        nix-top = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux"; # Or your system architecture
          modules = [
            inputs.musnix.nixosModules.musnix
            ./configuration.nix
            inputs.stylix.nixosModules.stylix
          ];
          specialArgs = { inherit inputs; }; # Pass quickshell to your modules
        };
    };
  };
}
