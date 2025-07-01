{
    description = "Evan's Flake Setup";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nvf = {
            url = "github:notashelf/nvf";
            # You can override the input nixpkgs to follow your system's
            # instance of nixpkgs. This is safe to do as nvf does not depend
            # on a binary cache.
            inputs.nixpkgs.follows = "nixpkgs";
        };
        lanzaboote = {
            url = "github:nix-community/lanzaboote/v0.4.2";

            # Optional but recommended to limit the size of your system closure.
            inputs.nixpkgs.follows = "nixpkgs";
        };
        niri.url = "github:sodiboo/niri-flake";
    };

    outputs = { self, nixpkgs, home-manager, nvf, lanzaboote , niri }: {
        nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                lanzaboote.nixosModules.lanzaboote
                ./configuration.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.sharedModules = [nvf.homeManagerModules.default niri.homeModules.niri];
                    home-manager.users.evank = ./home;
                }
            ];
        };

    };
}
