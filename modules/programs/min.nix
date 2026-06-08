# modules/programs/min.nix

{ stdenv
, lib
, fetchFromGitHub
, nodejs
, makeWrapper
, electron_35
, jq  
}:

let
  pname = "min";
  version = "1.35.1";

in stdenv.mkDerivation {
  inherit pname version;
  src = fetchFromGitHub {
    owner = "minbrowser";
    repo = "min";
    rev = "a8aa8ae271213597551bf83540b418851ace9033";
    hash = "sha256-CrJ5DJsNc9AVmJgtdo7sXO8k5xBab2iVmmloJA1ec2s=";
  };

  nativeBuildInputs = [
    nodejs
    makeWrapper
    jq 
  ];

  buildPhase = ''
    runHook preBuild
    export HOME=$(mktemp -d)
    # The jq command will now be available in the build environment
    jq 'del(.devDependencies.electron)' package.json > package.json.tmp && mv package.json.tmp package.json
    npm install
    npm run build -- --linux --x64
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/lib/${pname}
    cp -r dist/Min-linux-x64/* $out/lib/${pname}

    mkdir -p $out/bin
    makeWrapper $out/lib/${pname}/min $out/bin/min \
      --prefix PATH : ${lib.makeBinPath [ electron_35 ]}

    install -Dm644 extra/linux/min.desktop $out/share/applications/min.desktop
    install -Dm644 extra/linux/icons/128x128.png $out/share/icons/hicolor/128x128/apps/min.png
    install -Dm644 extra/linux/icons/256x256.png $out/share/icons/hicolor/256x256/apps/min.png
    install -Dm644 extra/linux/icons/512x512.png $out/share/icons/hicolor/512x512/apps/min.png

    substituteInPlace $out/share/applications/min.desktop \
      --replace "Icon=min" "Icon=min.png"
    runHook postInstall
  '';

  meta = with lib; {
    description = "A fast, minimal browser that protects your privacy";
    homepage = "https://minbrowser.org/";
    license = licenses.asl20;
    platforms = platforms.linux;
    # You can put your GitHub handle here if you like
    maintainers = [ maintainers.your_github_handle ];
  };
}
