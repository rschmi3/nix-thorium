# Nix Flake for installing and running Thorium Browser

Refer to the [Thorium Browser](https://thorium.rocks/) website for more information.


## Running without Installation

```bash
nix run github:rschmi3/nix-thorium
```

## Installation

```bash
nix profile install github:rschmi3/nix-thorium
```

## Installation with flakes
Add flake input
```
nix-thorium = {
    url = "github:rschmi3/nix-thorium";
    inputs.nixpkgs.follows = "nixpkgs";
};
```
Pass inputs to configuration.nix using specialArgs

Install package
```
environment.systemPackages = with pkgs; [
    inputs.nix-thorium.packages.x86_64-linux.thorium-sse4
];

```
