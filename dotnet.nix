
# development/dotnet-shell.nix
{ pkgs }:

pkgs.mkShell {
  name = "dotnet-dev";

  buildInputs = with pkgs; [
    # .NET SDK
    dotnet-sdk_8_0-bin

    # Development tools
    omnisharp-roslyn  # LSP server
    netcoredbg       # Debugger

    # Additional tools
    nuget-to-nix     # Nix integration
    sqlite
    postgresql
  ];

  shellHook = ''
    echo "🟣 .NET Development Environment"
    echo "==============================="
    echo "SDK: $(dotnet --version)"
    echo ""
    echo "Available commands:"
    echo "  • dotnet new console     - Create new console app"
    echo "  • dotnet new webapi      - Create new Web API"
    echo "  • dotnet new mvc         - Create new MVC app"
    echo "  • dotnet run             - Run application"
    echo "  • dotnet build           - Build application"
    echo "  • dotnet test            - Run tests"
    echo ""

    # Set up local NuGet cache
    export NUGET_PACKAGES="$PWD/.nuget/packages"
  '';
}
