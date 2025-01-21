{ pkgs, username, ... }:
{

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    nix-tree
    ripgrep
    fd # faster find
  ];

  programs = {
    ssh = {
      enable = true;
      extraConfig = '''';
    };
  };
}
