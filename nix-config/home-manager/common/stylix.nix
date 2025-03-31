{
  pkgs,
  stylix,
  lib,
  ...
}:
{
  stylix.enable = true;
  stylix.image = /home/fkf/wallpaper.image;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
  stylix.opacity = {
    # applications = 1.0;
    terminal = 0.75;
    desktop = 1.0;
    popups = 1.0;
  };
  stylix.polarity = "dark";

  stylix.targets.kitty.enable = true;
  stylix.targets.foot.enable = true;
  stylix.targets.waybar.enable = true;
  stylix.targets.fish.enable = true;
  # stylix.targets.spicetify.enable = false;
  stylix.targets.hyprland.enable = true;
  stylix.targets.zellij.enable = true;
  stylix.targets.tmux.enable = false;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  stylix.cursor = {
    package = pkgs.catppuccin-cursors.mochaMauve;
    name = "catppuccin-mocha-mauve-cursors";
    size = 24;
  };

  stylix.iconTheme = {
    enable = true;
    package = pkgs.kora-icon-theme;
    dark = "kora";
  };
  stylix.fonts = {
    # monospace = {
    #   package = pkgs.pixel-code;
    #   name = "Pixel Code";
    # };
monospace = {
    package = pkgs.nerd-fonts.jetbrains-mono;
    name = "JetbrainsMono Nerd Font";
  };



    sansSerif = {
      package = pkgs.ubuntu-sans;
      name = "Ubuntu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sizes = {
      applications = 12;
      desktop = 12;
      terminal = 11;
      popups = 12;
    };
  };

  ### enable apps

  programs.wofi.enable = true;
}
