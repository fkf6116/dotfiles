{ pkgs, lib, ... }:
{
  # programs.starship = {
  #   enable = true;
  #   # Configuration written to ~/.config/starship.toml
  #   settings = {
  #     add_newline = true;
  #
  #     character = {
  #       success_symbol = "[➜](bold green)";
  #       error_symbol = "[➜](bold red)";
  #     };
  #     # package.disabled = true;
  #   };
  # };
  #
  # programs.starship = {
  #   enable = true;
  #   enableFishIntegration = true;
  #   settings = {
  #     add_newline = true;
  #     hostname.style = "bold green"; # don"t like the default
  #     username.style_user = "bold blue"; # don"t like the default
  #     format = lib.concatStrings [
  #       "$all"
  #       "$line_break"
  #       "$package"
  #       "$line_break"
  #       "$character"
  #       "$username"
  #     ];
  #     scan_timeout = 2000;
  #     character = {
  #       success_symbol = "➜";
  #       error_symbol = "➜";
  #     };
  #   };
  #   enableTransience = true;
  # };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch";
      ls = "eza -al --color=always --group-directories-first --icons";
      la = "eza -a --color=always --group-directories-first --icons";
      ll = "eza -l --color=always --group-directories-first --icons";
      lt = "eza -aT --color=always --group-directories-first --icons";

    };
    history = {
      size = 10000;
      path = "~/.config/zsh/history";
    };

  };

}
