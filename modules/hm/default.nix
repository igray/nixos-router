{ ... }:
{
  flake.homeModules = {
    base = ./base.nix;
    nvim = ./nvim;
    git = ./git;
    sh = ./sh;
  };

}
