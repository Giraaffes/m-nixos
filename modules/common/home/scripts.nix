{ pkgs, hostName, resolve, ... }:
let
  rebuild-script = import (resolve "derivations/rebuild-script.nix") {
    inherit pkgs;
    flakePath = "/home/marcus/nixos";
    configName = hostName;
  };
  rebuild-server-script = import (resolve "derivations/rebuild-server-script.nix") {
    inherit pkgs;
    flakePath = "/home/marcus/nixos";
  };
in
{
  home.packages = [ rebuild-script rebuild-server-script ];
}