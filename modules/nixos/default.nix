{
  flake.nixosModules = {
    monitoring = ./monitoring.nix;
    network = ./network.nix;
    sshd = ./sshd.nix;
    nix = ./nix.nix;
  };

}
