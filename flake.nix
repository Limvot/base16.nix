{
  description = "Nix utility functions to configure base16 themes";

  inputs = {
    fromYaml = {
      url = "github:Limvot/fromYaml";
      flake = false;
    };
  };

  outputs = { self, fromYaml, ... }:
    {
      lib = import ./lib fromYaml;

      nixosModule = import ./module.nix self;

      homeManagerModule = self.nixosModule;
      #
      # devShell = pkgs.mkShell rec {
      #   nativeBuildInputs = with pkgs; [
      #     nixfmt
      #   ];
      # };
    };
}
