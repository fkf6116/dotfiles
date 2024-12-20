{inputs, pkgs,lib,...}:

   let
     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
   in

programs.spicetify={
     enable = true;
     enabledExtensions = with spicePkgs.extensions; [
       adblock
       hidePodcasts
       shuffle # shuffle+ (special characters are sanitized out of extension names)
     ];
     theme = spicePkgs.themes.catppuccin;
     colorScheme = "mocha";
   };
