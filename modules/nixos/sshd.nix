{ username, ... }:
{

  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };
  };

  users.users.${username} = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGa2Fl7BrbkjzF9BxAODhMfHSQLCt/K41MkPOi8VZCoL"
    ];
  };
}
