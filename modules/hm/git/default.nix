{ pkgs, ... }:
{

  programs.git = {
    enable = true;
    userName = "igray";
    userEmail = "igray@users.noreply.github.com";
    extraConfig = {
      merge = {
        conflictStyle = "diff3";
      };
      core.editor = "nvim";
      color = {
        ui = true;
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
      };
      pull = {
        ff = "only";
      };
      init = {
        defaultBranch = "main";
      };
      submodule = {
        recurse = true;
      };
      difftastic = {
        enable = true;
        background = "light";
      };
      user = {
        signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGa2Fl7BrbkjzF9BxAODhMfHSQLCt/K41MkPOi8VZCoL";
      };
      gpg.format = "ssh";
      gpg.ssh = {
        allowedSignersFile = "~/.ssh/allowed_signers";
      };
      commit.gpgsign = true;
    };
  };

  home.file."./.ssh/allowed_signers".text = ''
    igray@users.noreply.github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGa2Fl7BrbkjzF9BxAODhMfHSQLCt/K41MkPOi8VZCoL
  '';
}
