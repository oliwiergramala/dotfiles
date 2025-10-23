{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "dotnet-env";

  description = "Development environment for building .NET applications with SkiaSharp on NixOS.";

  buildInputs = with pkgs; [
    # .NET SDK
    dotnetCorePackages.sdk_9_0

    # Core system libraries required by .NET runtime
    icu
    zlib
    openssl
    curl
    libunwind

    # SkiaSharp native dependencies
    freetype
    fontconfig
    expat
    libpng
    libGL
    harfbuzz
    xorg.libX11
    xorg.libXext
    xorg.libXrender
    xorg.libxcb
  ];

  DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = "false";

shellHook = ''
  	echo ".NET development shell loaded"
  	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD/.nuget/packages/skiasharp/*/runtimes/linux-x64/native
'';
}

