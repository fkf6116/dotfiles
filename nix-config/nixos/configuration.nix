# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

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

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = "nix-command flakes";
        # Opinionated: disable global registry
        flake-registry = "";
        # Workaround for https://github.com/NixOS/nix/issues/9574
        nix-path = config.nix.nixPath;
      };
      # Opinionated: disable channels
      channel.enable = true;

      # Opinionated: make flake registry and nix path match flake inputs
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

  # FIXME: Add the rest of your current configuration

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # boot.plymouth = {
  #   enable = true;
  #   theme = "rings";
  #   themePackages = [(pkgs.adi1090x-plymouth-themes.override {selected_themes = ["rings"];})];
  # };
  #
  boot.initrd.verbose = false;

  boot.consoleLogLevel = 0;

  boot.kernelParams = [
    "quiet"
    "udev.log_level=0"
  ];

  #    NOTE enableShit
  programs.hyprland.enable = true;
  programs.kdeconnect = {
    enable = true;
    # package = pkgs.gnomeExtensions.gsconnect;
  };
  programs.firefox.enable = true;

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
  };

  programs.fish.enable = true;
  programs.zsh.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  programs.nix-ld.enable = true;

  # users.defaultUserShell = pkgs.zsh;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      # nerd-fonts
      nerd-fonts.jetbrains-mono
      noto-fonts-cjk-sans
      noto-fonts-emoji
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
    ];
    # fontconfig.defaultFonts = {
    #   serif = [
    #     "Noto Serif"
    #     "Source Han Serif"
    #   ];
    #   sansSerif = [
    #     "Noto Sans"
    #     "Source Han Sans"
    #   ];
    # };
  };

  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # NOTE enable KDE or gnome

  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # services.xserver.desktopManager.gnome.enable = true;
  # services.xserver.displayManager.gdm.enable = true;

  #    NOTE Services

  networking.networkmanager.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.flatpak.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;

    #media-session.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    #package = pkgs.bluez5-experimental;
    package = pkgs.bluez;
    settings.Policy.AutoEnable = "true";
    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Name = "Hello";
      ControllerMode = "dual";
      FastConnectable = "true";
      Experimental = "true";
      KernelExperimental = "true";
    };
  };

  services.blueman.enable = true;

  security.polkit.enable = true;

  services.emacs = {
    enable = true;
    package = pkgs.emacs; # replace with emacs-gtk, or a version provided by the community overlay if desired.
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  systemd.services.NetworkManager-wait-online.enable = false;

  # TODO: Set your hostname
  networking.hostName = "pc";

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    # FIXME: Replace with your username
    fkf = {
      # TODO: You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      isNormalUser = true;
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "uinput"
        "input"
      ];

    };
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      PasswordAuthentication = false;
    };
  };

  environment.variables = {
    "QT_STYLE_OVERRIDE" = "kvantum";
    # XDG_CURRENT_DESKTOP = "Hyprland";
    # XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    GDK_BACKEND = "wayland";
    GTK_USE_PORTAL = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    MOZ_ENABLE_WAYLAND = "1";
    EDITOR = "nvim";

    MANPAGER = "nvim +Man!";

  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
  environment.systemPackages = with pkgs; [
    vim
    yazi
    unstable.neovim
    bottom
    fish
    git
    # ulauncher
    stow
    polybar
    waybar
    rofi-wayland
    fastfetch
    kitty
    kitty-themes
    kitty-img
    vesktop
    cowsay
    nodejs
    pipx
    zoxide
    gnome-tweaks
    hugo
    tldr
    fzf
    zellij
    pulseaudioFull
    starship
    eza
    ripgrep
    bat
    less
    wget
    swaybg
    waypaper
    slurp
    grimblast
    gh
    catppuccin-gtk
    catppuccin-cursors
    catppuccin-papirus-folders
    wl-clipboard
    unzip
    unrar
    github-desktop
    gcc
    clang
    clang-tools
    lua-language-server
    prettierd
    nwg-look
    stylua
    nodePackages.bash-language-server
    # nixd
    helix
    brightnessctl
    zig
    zls
    rust-analyzer
    bibata-cursors
    prismlauncher
    lxqt.lxqt-policykit
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    # kdePackages.breeze-gtk
    # kdePackages.breeze-icons
    # kdePackages.breeze.qt5
    # kdePackages.breeze
    # catppuccin-cursors # Mouse cursor theme
    # catppuccin-papirus-folders # Icon theme, e.g. for pcmanfm-qt
    # papirus-folders # For the catppucing stuff work
    # papirus-folders
    # catppuccin-kde
    # sweet-nova
    # nordic
    nil
    ffmpeg
    obs-studio
    pcmanfm
    lazygit
    swaynotificationcenter
    fd
    vscode
    home-manager
    neovide
    sxiv
    zathura
    mpv
    base16-schemes
    bluez
    bluez-tools
    hyprcursor
    hyprpaper
    nixd
    nixfmt-rfc-style
    sxiv
    # brave
    unstable.joplin-desktop
    krita
    pinta
    gimp
    blender
    godot_4
    tilix
    wofi
    playerctl
    pipes
    lolcat
    figlet
    emacs
    coreutils
    man-pages
    man-pages-posix
    pavucontrol
    lsp-plugins
    easyeffects
    pkgs.gnome-keyring
    zsh
    ytmdl
    markdown-oxide
    ispell
    unstable.marksman
    cargo
    rustc
    shfmt
    shellcheck
    tidyp
    stylelint
    glslang
    pandoc
    hugo
    cmus
    hyprland
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.hyprpanel
    hub
    dwt1-shell-color-scripts
  ];

}
