{ inputs, ... }:
{
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    withNodeJs = false;

    imports = [
      inputs.nixvim-config.nixvimModule
    ];
  };
}
