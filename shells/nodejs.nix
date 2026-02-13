{ pkgs }:

let
  mkNodejs =
    { version, sha256 }:
    pkgs.stdenv.mkDerivation {
      pname = "nodejs";
      inherit version;

      src = pkgs.fetchurl {
        url = "https://nodejs.org/dist/v${version}/node-v${version}-linux-x64.tar.xz";
        inherit sha256;
      };

      nativeBuildInputs = [ pkgs.autoPatchelfHook ];
      buildInputs = [ pkgs.stdenv.cc.cc.lib ];

      dontBuild = true;
      dontConfigure = true;

      installPhase = ''
        mkdir -p $out
        cp -r ./* $out/
      '';
    };

  nodeVersions = {
    node-22 = {
      version = "22.18.0";
      sha256 = "c1bfeecf1d7404fa74728f9db72e697decbd8119ccc6f5a294d795756dfcfca7";
    };
    node-25 = {
      version = "25.5.0";
      sha256 = "8223dca08b48b927acafaae7595dc670c86f7aa1855a20019bd43f8ea890851c";
    };
    node-20 = {
      version = "20.10.0";
      sha256 = "3fe4ec5d70c8b4ffc1461dec83ab23fc70124e137c4cbbe1ccc9d6ae6ec04a7d";
    };
  };

in
builtins.mapAttrs (
  name: cfg:
  pkgs.mkShell {
    inherit name;
    packages = [ (mkNodejs cfg) ];
    shellHook = ''
      echo "Node.js $(node --version) development environment"
    '';
  }
) nodeVersions
