{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    python3
    python3Packages.pip

    # .NET SDKs
    dotnet-sdk_8
    dotnet-sdk_9
  ];

  shellHook = ''
    echo "🚀 Python + .NET (8 & 9) devshell loaded!"
    echo "Available SDKs:"
    dotnet --list-sdks || echo ".NET not found — check nixpkgs version."
  '';
}
