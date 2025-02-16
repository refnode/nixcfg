{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkgs,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "garden";
  version = "v2.0.0";

  src = fetchFromGitHub {
    owner = "garden-rs";
    repo = "garden";
    rev = version;
    hash = "sha256-4cYrUD0fomlS+hatf5A965wkDjKV98QQG8dQGaLUCYs=";
  };

  cargoLock.lockFileContents = builtins.readFile ./Cargo.lock;

  postPatch = ''
    ln -s ${./Cargo.lock} Cargo.lock
  '';

  nativeBuildInputs = [
    pkgs.git
  ];
}
