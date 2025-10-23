{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "go-env";

  description = "Development environment for building Go applications on NixOS.";

  buildInputs = with pkgs; [
    go
    gopls            # Go language server for editors
    delve            # Go debugger
    golangci-lint    # Linter
    go-tools         # Extra Go tools like goimports
    git
  ];

  shellHook = ''
    echo "Go development shell loaded!"
    echo "Go version: $(go version)"
  '';
}

