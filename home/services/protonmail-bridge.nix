{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    protonmail-bridge
  ];
  systemd.user.services = {
    protonmail-bridge-service = {
      Unit = {
        Description = "Start the protonmail service bridge in the background";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };


      Service = {
        ExecStart = ''${pkgs.protonmail-bridge}/bin/protonmail-bridge --grpc'';
      };
    };
  };
}
