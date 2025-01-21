{ inputs, username, ... }:
{
  nixpkgs.hostPlatform = "aarch64-linux";
  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
  };
  swapDevices = [ ];

  imports = [
    inputs.self.nixosModules.nix
    ./custom.nix
    inputs.self.nixosModules.sshd
    inputs.self.nixosModules.monitoring
    inputs.self.nixosModules.network
    inputs.home-manager.nixosModule
    inputs.nixos-hardware.nixosModules.raspberry-pi-4
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.${username} = {
      imports = [
        inputs.self.homeModules.base
        inputs.nixvim.homeManagerModules.nixvim
        inputs.self.homeModules.nvim
        inputs.self.homeModules.sh
        inputs.self.homeModules.git
      ];
    };
    extraSpecialArgs = { inherit username; };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It’s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
