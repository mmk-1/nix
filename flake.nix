{
  description = "Home Manager configuration of mmk";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Applying the configuration happens from the .dotfiles directory so the
    # relative path is defined accordingly. This has potential of causing issues.
    vim-plugins = {
      url = "path:./config/nvim/plugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, vim-plugins, home-manager, ... }:
    let
      # system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system};
      home-common = { pkgs, lib, ... }:
        {
          home.username = "mmk";
          home.homeDirectory = "/home/mmk";

          nixpkgs.overlays = [
            vim-plugins.overlay
          ];

          # Let Home Manager install and manage itself.
          programs.home-manager.enable = true;
          home.stateVersion = "23.11";

          imports = [
            ./config/nvim
          ];
        };
    in {
      # homeConfigurations."mmk" = home-manager.lib.homeManagerConfiguration {
      #   inherit pkgs;
      # };

       homeConfigurations = {
        mmk = 
          let 
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
          in 
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              home-common
              # home-linux
            ];
        };

        # nixos =
        #   let
        #     system = "x86_64-linux";
        #     pkgs = nixpkgs.legacyPackages.${system};
        #   in
        #   home-manager.lib.homeManagerConfiguration {
        #     inherit pkgs;
        #     modules = [
        #       home-common
        #       home-linux
        #     ];
        #   };

        # macbook-pro =
        #   let
        #     system = "x86_64-darwin";
        #     pkgs = nixpkgs.legacyPackages.${system};
        #   in
        #   home-manager.lib.homeManagerConfiguration {
        #     inherit pkgs;
        #     modules = [
        #       home-common
        #       home-macbook
        #     ];
        #   };
      };
      
    };
}
