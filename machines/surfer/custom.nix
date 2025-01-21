{
  lib,
  pkgs,
  username,
  inputs,
  ...
}:
{

  system.stateVersion = lib.mkDefault "22.11";

  # powerManagement = {
  #   enable = true;
  #   cpuFreqGovernor = "ondemand";
  # };

  users.users.${username} = {
    name = username;
    home = "/home/${username}";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "network"
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };

  services.journald.extraConfig = "SystemMaxUse=100M";

  system.autoUpgrade = {
    enable = false;
    dates = "weekly";
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
    ];
    allowReboot = true;
    rebootWindow = {
      lower = "02:00";
      upper = "04:00";
    };
  };

  programs = {
    fish.enable = true;
    ssh = {
      startAgent = true;
    };
    command-not-found.enable = false;
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    git
    wget
    curl

    neofetch
    nnn # terminal file manager
    bottom # replacement of htop/nmon
    htop
    iotop
    iftop
    nmon

    # system call monitoring
    strace
    ltrace # library call monitoring
    lsof

    mtr # A network diagnostic tool
    iperf3 # A tool for measuring TCP and UDP bandwidth performance
    nmap # A utility for network discovery and security auditing
    ldns # replacement of dig, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    tcpdump # A powerful command-line packet analyzer
    ethtool # manage NIC settings (offload, NIC feeatures, ...)
    dnsutils # dig

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    pciutils
    lshw

    # archives
    zip
    xz
    unzip
    p7zip

    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
  ];

  # replace default editor with neovim
  environment.variables.EDITOR = "nvim";
}
