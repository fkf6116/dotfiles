# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    ../common/stylix.nix
    ../common/spot.nix
    ../common/shell-stuff.nix
    ../common/tmux.nix
    ../common/zsh.nix
    ../common/fish.nix
    ../common/fancy.nix
    ../common/hypr.nix
    ../common/sway.nix
    ../common/waybar.nix
    ../common/term.nix
    # ../common/vim.nix

    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  xdg.enable = true;
  xdg.mimeApps.enable = true;
  xdg.configFile."mimeapps.list".force = true;


xdg.mimeApps.defaultApplications = {
  "text/plain" = [ "neovide.desktop" ];
  "application/pdf" = [ "zathura.desktop" ];
  "image/jpeg" = [ "feh.desktop" ];
  "image/png" = [ "feh.desktop" ];
  "image/gif" = [ "feh.desktop" ];
  "video/mp4" = [ "mpv.desktop" ];
  "default-web-browser" = [ "firefox.desktop" ];
  "text/html" = [ "firefox.desktop" ];
  "x-scheme-handler/http" = [ "firefox.desktop" ];
  "x-scheme-handler/https" = [ "firefox.desktop" ];
  "x-scheme-handler/about" = [ "firefox.desktop" ];
  "x-scheme-handler/unknown" = [ "firefox.desktop" ];
};


  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  # TODO: Set your username
  home = {
    username = "fkf";
    homeDirectory = "/home/fkf";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
