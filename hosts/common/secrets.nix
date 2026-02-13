{...}:
  let
    secretsDir = ../../secrets;
  in {
  sops = {
    age = {
      # TODO: move to ssh key
      keyFile = "/home/joeri/.config/sops/age/keys.txt";
      generateKey = false;
    };

    defaultSopsFile = "${secretsDir}/sops-secrets.yaml";
    validateSopsFiles = false;

    secrets = {
      "joeri-password" = {
        neededForUsers = true;
      };
    };
  };
}