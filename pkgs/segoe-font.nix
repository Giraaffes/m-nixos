{ pkgs, name, fontPath, ... }:
pkgs.stdenvNoCC.mkDerivation {
  pname = name;
  version = "1.0";

  src = fontPath;

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    
    mkdir -p $out/share/fonts/truetype
    cp -a *.ttf $out/share/fonts/truetype/
    
    runHook postInstall
  '';
}