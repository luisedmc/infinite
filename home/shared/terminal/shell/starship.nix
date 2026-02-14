{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      character = {
        success_symbol = "[ ](bold white)";
        error_symbol = "[❯](bold red)";
        vimcmd_symbol = "[❯❯](#bbac9b)";
      };

      directory = {
        read_only = " 󰌾";
        truncation_length = 0;
        style = "#0DD4E5";
      };

      git_branch = {
        format = "[:git\\([$branch]($style)\\)](bold white)";
        style = "#C74C73";
      };

      git_status = {
        format = "[[($conflicted$untracked$modified$staged$renamed$deleted)]($style) (:$ahead_behind:$stashed)]($style)";
        style = "#AA6DD6";

        conflicted = "::conflicted";
        untracked = "::untracked";
        modified = "::modified";
        staged = "::staged";
        renamed = "::renamed";
        deleted = "::deleted";
        stashed = "::stashed";
      };

      aws.symbol = "  ";
      buf.symbol = " ";
      bun.symbol = " ";
      c.symbol = " ";
      cmake.symbol = " ";
      conda.symbol = " ";
      crystal.symbol = " ";
      dart.symbol = " ";
      deno.symbol = " ";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      fennel.symbol = " ";
      fossil_branch.symbol = " ";
      gcloud.symbol = "  ";
      golang.symbol = " ";
      guix_shell.symbol = " ";
      haskell.symbol = " ";
      haxe.symbol = " ";
      hg_branch.symbol = " ";

      hostname = {
        ssh_symbol = " ";
      };

      java.symbol = " ";
      julia.symbol = " ";
      kotlin.symbol = " ";
      lua.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      meson.symbol = "󰔷 ";
      nim.symbol = "󰆥 ";
      nix_shell.symbol = " ";
      nodejs.symbol = "󰎙 ";
      ocaml.symbol = " ";
      package.symbol = "󰏗 ";
      perl.symbol = " ";
      php.symbol = " ";
      pijul_channel.symbol = " ";
      python.symbol = " ";
      rlang.symbol = "󰟔 ";
      ruby.symbol = " ";
      rust.symbol = "󱘗 ";
      scala.symbol = " ";
      swift.symbol = " ";
      zig.symbol = " ";
      gradle.symbol = " ";
    };
  };
}
