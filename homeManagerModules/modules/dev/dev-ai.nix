

  { config, lib, unstable-pkgs, ... }: let
    cfg = config.homeconfig.dev.ai;
    mistralNixPkgs = unstable-pkgs.fetchFromGitHub {
      owner = "shikanime";
      repo = "nixpkgs";
      rev = "trunks/shika/xtysnytzuzzq";
      sha256 = "sha256-feL6PWkICEj+o1g4VA8hmKX8gm2iy/NPqIvCzn4sjf4=";
    };

    mistralPkgs = import "${mistralNixPkgs}" {
      system = "x86_64-linux";
    };
in {
  options.homeconfig.dev.ai = {
    enable = lib.mkEnableOption "devAi";
  };
  config = lib.mkIf cfg.enable {
    home.packages = [
        mistralPkgs.mistral-vibe
    ];
  };
}
