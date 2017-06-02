with (import <nixpkgs> {});

let 
  jar = buildMaven ./project-info.json;
in stdenv.mkDerivation rec {
  buildInputs = [ makeWrapper ];
  name = "socks-carts";
  buildCommand = ''
    mkdir -p $out/share/java $out/bin
    cp ${jar.build} $out/share/java/
    makeWrapper ${jre_headless}/bin/java $out/bin/${name} \
      --add-flags "-jar $out/share/java/${jar.build}"
  '';
}
