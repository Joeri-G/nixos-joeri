{
  pkgs,
  ...
}:
let
  vmOptions = ''
    -Xmx8192m
    -Dawt.toolkit.name=WLToolkit
  '';
in
{
  home.packages = with pkgs; [
    # jetbrains.clion
    # jetbrains.webstorm
    # jetbrains.pycharm-professional
    jetbrains.idea
    # jetbrains.rust-rover
  ];

  home.file = {
    ".config/JetBrains/IntelliJIdea2024.1/idea64.vmoptions".text = vmOptions;
    # ".config/JetBrains/PyCharm2024.1/pycharm64.vmoptions".text = vmOptions;
    # ".config/JetBrains/CLion2024.1/clion64.vmoptions".text = vmOptions;
  };

}
