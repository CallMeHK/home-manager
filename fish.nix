fetchFromGitHub: {
    enable = true;
    interactiveShellInit = ''
      source ~/.config/home-manager/config.fish
    '';
    plugins = [
    {
      name = "bass";
      src = fetchFromGitHub {
        owner = "edc";
        repo = "bass";
        rev = "50eba266b0d8a952c7230fca1114cbc9fbbdfbd4";
        sha256 = "0ppmajynpb9l58xbrcnbp41b66g7p0c9l2nlsvyjwk6d16g4p4gy";
      };
    }
    ];
}
