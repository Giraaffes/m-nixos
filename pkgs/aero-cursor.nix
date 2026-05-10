{ pkgs, name, cursorName, cursorPath, ... }:
pkgs.stdenvNoCC.mkDerivation {
  pname = name;
  version = "1.0";

  src = cursorPath;

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    
    mkdir -p $out/share/icons/${cursorName}
    cp -a * $out/share/icons/${cursorName}/
    
    runHook postInstall
  '';
}