{ pkgs, inputs, ... }:
{
  home.packages = [
    pkgs.vscode
    inputs.claude-code.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
