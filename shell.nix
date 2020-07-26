let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  stdenv = pkgs.stdenv;
  pythonEnv = pkgs.poetry2nix.mkPoetryEnv {
    python = pkgs.python38;
    poetrylock = ./poetry.lock;
    overrides = pkgs.poetry2nix.overrides.withDefaults (self: super: {
      kiwisolver = super.kiwisolver.overridePythonAttrs
        (old: { buildInputs = old.buildInputs ++ [ self.cppy ]; });
      f90wrap = super.f90wrap.overridePythonAttrs
        (old: { nativeBuildInputs = old.buildInputs ++ [ pkgs.gfortran ]; });
      matscipy = super.matscipy.overridePythonAttrs
        (old: { buildInputs = old.buildInputs ++ [ self.scipy ]; });
    });
  };
in pkgs.mkShell {
  buildInputs = with pkgs; [ libxc openblas gfortran pythonEnv ];
  shellHook = ''
    mkdir -p "$(pwd)/_libs"
    export R_LIBS_USER="$(pwd)/_libs"
  '';
  GIT_SSL_CAINFO = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  LOCALE_ARCHIVE = stdenv.lib.optionalString stdenv.isLinux
    "${pkgs.glibcLocales}/lib/locale/locale-archive";
}
