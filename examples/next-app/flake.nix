{
  description = "Webapp development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    devShells."${system}" = {
      default = pkgs.mkShell {
      packages = with pkgs; [
        git
        bun
        # nodePackages.pnpm
        #(yarn.override { nodejs = nodejs_18; })
        # Add nvm if needed
        # nvm
      ];

      # Environment variables
      shellHook = ''
        
        echo "node `${pkgs.nodejs}/bin/node --version`"
        echo "update"

        # You can uncomment this if you want the dev server to start automatically
        # npm run dev
      '';
    };

    node = pkgs.mkShell {
      packages = with pkgs; [
        git
        nodejs_20
        pnpm_8
        # nodePackages.pnpm
        #(yarn.override { nodejs = nodejs_18; })
        # Add nvm if needed
        # nvm
      ];

      # Environment variables
      shellHook = ''
        echo "node `${pkgs.nodejs}/bin/node --version`"
        echo "update"

              echo "Development environment setup complete"
      '';
    };    
    };
  };
}