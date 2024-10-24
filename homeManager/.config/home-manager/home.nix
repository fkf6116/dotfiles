{ pkgs, ... }:

## NOTE I didn't bother with removing the comments :3

{
  imports = [ ./shell-stuff.nix ./term.nix ./stylix.nix ./tmux.nix ];

  home.username = "fkf";
  home.homeDirectory = "/home/fkf";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # home.packages = with pkgs; [  ];

  home.file = { };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  # or reference it directly in your Hyprland configuration
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
