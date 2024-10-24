{ pkgs, ... }: {
  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      add_newline = true;

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
      # package.disabled = true;
    };
  };

  # programs.zsh = {
  #   enable = true;
  #   enableCompletion = true;
  #   autosuggestion.enable = true;
  #   syntaxHighlighting.enable = true;
  #
  #   shellAliases = {
  #     ll = "ls -l";
  #     update = "sudo nixos-rebuild switch";
  #   };
  #   history = {
  #     size = 10000;
  #     path = "~/.config/zsh/history";
  #   };
  #
  # };

}
