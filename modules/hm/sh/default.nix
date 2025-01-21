{ pkgs, ... }:
{
  programs = {
    fish = {
      enable = true;
      functions = {
        currentGitBranch = "git branch --show-current";
        gsb = {
          body = ''
            command git branch $argv
            command git checkout $argv
          '';
        };
        gpr = "git push --set-upstream origin (currentGitBranch)";
      };
      plugins = [
      ];
      shellAliases = {
        # git

        gcm = "git commit --message";
        gco = "git checkout";
        gpush = "git push";
        gb = "git branch";

        # other
        doh = ''
          commandline -i "sudo $history[1]";history delete --exact --case-sensitive doh
        '';
        ltr = "ls -l -snew";
        lsd = "${pkgs.eza}/bin/exa --long --header --git --all";
      };
      shellInit = '''';
    };
    dircolors = {
      enable = true;
      enableFishIntegration = true;
    };
    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };
    eza = {
      enable = true;
      enableFishIntegration = true;
      git = true;
      icons = "auto";
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
