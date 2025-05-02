
{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
      format = "$directory$character";
      right_format = "$all";
      command_timeout = 1000;

      character = {
        vicmd_symbol = "[N] >>>";
        success_symbol = "[➜](bold green)";
      };

      git_branch.format = "[$symbol$branch(:$remote_branch)]($style)";

      aws = {
        format = "[$symbol(profile: \"$profile\" )(\\(region: $region\\) )]($style)";
        disabled = false;
        style = "bold blue";
        symbol = " ";
      };

      docker_context.disabled = true;

      kubernetes = {
        symbol = "☸ ";
        disabled = true;
        detect_files = [ "Dockerfile" ];
        format = "[$symbol$context( \\($namespace\\))]($style) ";
        contexts = [
          {
            context_pattern = "arn:aws:eks:us-west-2:577926974532:cluster/zd-pvc-omer";
            style = "green";
            context_alias = "omerxx";
            symbol = " ";
          }
        ];
      };

      rust.symbol = " ";
      lua.symbol = " ";
      python.symbol = " ";
      nodejs.symbol = " ";
      java.symbol = " ";
      golang.symbol = " ";
      c.symbol = " ";
      php.symbol = " ";
      ruby.symbol = " ";
      perl.symbol = " ";
      elixir.symbol = " ";
      erlang.symbol = " ";
      scala.symbol = " ";
      swift.symbol = " ";
      dart.symbol = " ";
      haskell.symbol = " ";
      typescript.symbol = " ";
      kotlin.symbol = " ";
      dotnet.symbol = " ";
    };
  };
}
