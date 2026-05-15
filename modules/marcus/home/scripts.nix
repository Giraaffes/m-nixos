{ pkgs, resolve, ... }:
let
  unlock-script = import (resolve "pkgs/unlock-script.nix") {
    inherit pkgs;
  };
in
{
  home.packages = [ unlock-script ];
}
