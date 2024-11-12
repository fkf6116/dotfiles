{
  pkgs,
  stylix,
  lib,
  ...
}:

{

  stylix.enable = true;
  stylix.image = /home/fkf/wallpapers/desktop-wallpaper/simply-muted/muted-11.png;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

  stylix.opacity = {
    applications = 1.0;
    terminal = 0.75;
    desktop = 1.0;
    popups = 1.0;
  };
  stylix.polarity = "dark";

  stylix.targets.kitty.enable = true;
  stylix.targets.foot.enable = true;
  stylix.targets.waybar.enable = true;
  stylix.targets.fish.enable = true;
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
  programs.wofi.enable = true;
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";

  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
  };

}
