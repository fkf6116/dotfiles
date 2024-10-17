{ config, pkgs, ... }:

## NOTE I didn't bother with removing the comments :3


{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "fkf";
  home.homeDirectory = "/home/fkf";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/fkf/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
stylix.enable = true;
stylix.image = /home/fkf/Downloads/nix-wallpaper-nineish-catppuccin-frappe-alt.png;

  programs.git = {
    enable = true;
    userName = "fruity-fkf";
    userEmail = "fkf.6106@gmail.com";
  };

gtk = {
  enable = true;
  theme.name = "adw-gtk3";
  cursorTheme.name = "Bibita-Modern-Ice";
  iconTheme.name = "GruvboxPlus";
};


xdg.mimeApps.defaultApplications = {
"text/plain" = [ "neovide.desktop"];
"application/pdf" = [ "zathura.desktop"];
"image/*" = [ "sxiv.desktop"];
"video/png" = [ "mpv.desktop"];
"video/jpg" = [ "mpv.desktop"];
"video/*" = [ "mpv.desktop"];
};



  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";




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


stylix.cursor.package = pkgs.bibata-cursors;
stylix.cursor.name = "Bibata-Modern-Ice";

stylix.fonts = {
  monospace = {
    package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
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


programs.kitty = {
  enable = true;
  settings = {
    confirm_os_window_close = 0;
    dynamic_background_opacity = true;
    enable_audio_bell = false;
    mouse_hide_wait = "-1.0";
    window_padding_width = 10;
    # background_opacity = "0.5";
    background_blur = 5;
    symbol_map = let
      mappings = [
        "U+23FB-U+23FE"
        "U+2B58"
        "U+E200-U+E2A9"
        "U+E0A0-U+E0A3"
        "U+E0B0-U+E0BF"
        "U+E0C0-U+E0C8"
        "U+E0CC-U+E0CF"
        "U+E0D0-U+E0D2"
        "U+E0D4"
        "U+E700-U+E7C5"
        "U+F000-U+F2E0"
        "U+2665"
        "U+26A1"
        "U+F400-U+F4A8"
        "U+F67C"
        "U+E000-U+E00A"
        "U+F300-U+F313"
        "U+E5FA-U+E62B"
      ];
    in
      (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font";
  };
};




  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
