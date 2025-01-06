{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      nvf,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      # Supported systems for your flake packages, shell, etc.
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

      imports = [ inputs.nvf.homeManagerModules.default ];

      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
      overlays = import ./overlays { inherit inputs; };
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        # FIXME replace with your hostname
        pc = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;

          };
          modules = [
            # > Our main nixos configuration file <
            ./nixos/configuration.nix

            { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
          ];
        };

        thonkpad = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;

          };
          modules = [
            # > Our main nixos configuration file <
            ./nixos/thinkpad_configuration.nix
          ];
        };
      };

      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        # FIXME replace with your username@hostname
        "fkf@pc" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            stylix.homeManagerModules.stylix
            inputs.spicetify-nix.homeManagerModules.default
            nvf.homeManagerModules.default
            ./home-manager/pc/home.nix
          ];
        };

        "fkf@arch" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            stylix.homeManagerModules.stylix
            ./home-manager/non-nix/home-non-nix.nix
          ];
        };

        "fkf@thonkpad" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            stylix.homeManagerModules.stylix
            inputs.spicetify-nix.homeManagerModules.default
            ./home-manager/thonkpad/home.nix
          ];
        };
      };
    };
}
