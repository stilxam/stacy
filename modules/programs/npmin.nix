# modules/programs/min.nix

{ stdenv
, lib
, fetchFromGitHub
, electron_35
, makeWrapper
, jq
, buildNpmPackage
, nodejs
}:

let
  pname = "min";
  version = "1.35.1";

  src = fetchFromGitHub {
    owner = "minbrowser";
    repo = "min";
    rev = "a8aa8ae271213597551bf83540b418851ace9033";
    hash = "sha256-CrJ5DJsNc9AVmJgtdo7sXO8k5xBab2iVmmloJA1ec2s=";
  };

  # STEP A: Create a derivation whose only purpose is to generate the package-lock.json file.
  package-lock = stdenv.mkDerivation {
    name = "${pname}-${version}-package-lock";
    inherit src;

    nativeBuildInputs = [ nodejs jq ];

    # We patch the package.json here too, so the lock file doesn't include Electron.
    patchPhase = ''
      jq 'del(.devDependencies.electron)' package.json > package.json.tmp && mv package.json.tmp package.json
    '';

    # This command creates the lock file without downloading all of node_modules.
    buildPhase = ''
      npm install --package-lock-only
    '';

    # Install the generated file into the output of this derivation.
    installPhase = ''
      install -Dm644 package-lock.json $out/package-lock.json
    '';
  };

in
# STEP B: Use buildNpmPackage, which is the correct tool for the job.
buildNpmPackage {
  inherit pname version src;

  # This is the hash of the full node_modules directory, which will be
  # derived from the package-lock.json we generated above.
  npmDepsHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # <-- Placeholder hash

  # STEP C: Inject the generated package-lock.json into the source before building.
  postPatch = ''
    cp ${package-lock}/package-lock.json .
  '';

  # This runs before the main npm install. We still need to remove the
  # electron dependency from package.json for the actual build.
  preConfigure = ''
    jq 'del(.devDependencies.electron)' package.json > package.json.tmp && mv package.json.tmp package.json
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/$pname
    cp -r dist/Min-linux-x64/* $out/lib/$pname

    mkdir -p $out/bin
    makeWrapper $out/lib/$pname/min $out/bin/min \
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
    maintainers = [ maintainers.your_github_handle ];
  };
}
