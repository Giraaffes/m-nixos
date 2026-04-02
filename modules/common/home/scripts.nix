{ pkgs, hostName, resolve, ... }:
let
  rebuild-script = import (resolve "derivations/rebuild-script.nix") {
    inherit pkgs;
    flakePath = "/home/marcus/nixos";
    configName = hostName;
  };
in
{
  home.packages = [ rebuild-script ];
}