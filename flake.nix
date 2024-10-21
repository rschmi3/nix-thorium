{
  description = "Thorium using Nix Flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }: {
    ##### x86_64-linux #####
    packages.x86_64-linux =
      let pkgs = import nixpkgs { system = "x86_64-linux"; };
      in {
        thorium-avx = let
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          name = "thorium-avx";
          version = "128.0.6613.189 - 61";
          src = pkgs.fetchurl {
            url =
              "https://github.com/Alex313031/thorium/releases/download/M128.0.6613.189/Thorium_Browser_128.0.6613.189_AVX.AppImage";
            sha256 = "0sqj9i85i9i5sqbabs6z7qc9489rwv9g8wdni6bdh6qa3hpwgj35";
          };
          appimageContents = pkgs.appimageTools.extract { inherit name src; };
        in pkgs.appimageTools.wrapType2 {
          inherit name version src;
          extraInstallCommands = ''
            install -m 444 -D ${appimageContents}/thorium-browser.desktop $out/share/applications/thorium-browser.desktop
            install -m 444 -D ${appimageContents}/thorium.png $out/share/icons/hicolor/512x512/apps/thorium.png
            substituteInPlace $out/share/applications/thorium-browser.desktop \
            --replace 'Exec=thorium' 'Exec=${name} %U'
          '';
        };

        thorium-avx2 = let
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          name = "thorium-avx2";
          version = "128.0.6613.189 - 61";
          src = pkgs.fetchurl {
            url =
              "https://github.com/Alex313031/thorium/releases/download/M128.0.6613.189/Thorium_Browser_128.0.6613.189_AVX2.AppImage";
            sha256 = "05cjx4iqs4y9y04h6axydmj6kldd13v9zp82bq50xs051hdd44s4";
          };
          appimageContents = pkgs.appimageTools.extract { inherit name src; };
        in pkgs.appimageTools.wrapType2 {
          inherit name version src;
          extraInstallCommands = ''
            install -m 444 -D ${appimageContents}/thorium-browser.desktop $out/share/applications/thorium-browser.desktop
            install -m 444 -D ${appimageContents}/thorium.png $out/share/icons/hicolor/512x512/apps/thorium.png
            substituteInPlace $out/share/applications/thorium-browser.desktop \
            --replace 'Exec=thorium' 'Exec=${name} %U'
          '';
        };

        thorium-sse3 = let
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          name = "thorium-sse3";
          version = "128.0.6613.189 - 61";
          src = pkgs.fetchurl {
            url =
              "https://github.com/Alex313031/thorium/releases/download/M128.0.6613.189/Thorium_Browser_128.0.6613.189_SSE3.AppImage";
            sha256 = "00zvf0pia30ixgiscpflic4mhm67ps60a5fdh43dlqncci4d1fxv";
          };
          appimageContents = pkgs.appimageTools.extract { inherit name src; };
        in pkgs.appimageTools.wrapType2 {
          inherit name version src;
          extraInstallCommands = ''
            install -m 444 -D ${appimageContents}/thorium-browser.desktop $out/share/applications/thorium-browser.desktop
            install -m 444 -D ${appimageContents}/thorium.png $out/share/icons/hicolor/512x512/apps/thorium.png
            substituteInPlace $out/share/applications/thorium-browser.desktop \
            --replace 'Exec=thorium' 'Exec=${name} %U'
          '';
        };

        thorium-sse4 = let
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          name = "thorium-sse4";
          version = "128.0.6613.189 - 61";
          src = pkgs.fetchurl {
            url =
              "https://github.com/Alex313031/thorium/releases/download/M128.0.6613.189/Thorium_Browser_128.0.6613.189_SSE4.AppImage";
            sha256 = "17cz64qvhjz70b2bqlj84l4h4z8g18j6g1spk8gpaiy668pwgbbb";
          };
          appimageContents = pkgs.appimageTools.extract { inherit name src; };
        in pkgs.appimageTools.wrapType2 {
          inherit name version src;
          extraInstallCommands = ''
            install -m 444 -D ${appimageContents}/thorium-browser.desktop $out/share/applications/thorium-browser.desktop
            install -m 444 -D ${appimageContents}/thorium.png $out/share/icons/hicolor/512x512/apps/thorium.png
            substituteInPlace $out/share/applications/thorium-browser.desktop \
            --replace 'Exec=thorium' 'Exec=${name} %U'
          '';
        };

        # AVX is compatible with most CPUs
        default = self.packages.x86_64-linux.thorium-avx;
      };

    apps.x86_64-linux = {
      thorium-avx = {
        type = "app";
        program = "${self.packages.x86_64-linux.thorium-avx}/bin/thorium-avx";
      };

      thorium-avx2 = {
        type = "app";
        program = "${self.packages.x86_64-linux.thorium-avx2}/bin/thorium-avx2";
      };

      thorium-sse3 = {
        type = "app";
        program = "${self.packages.x86_64-linux.thorium-sse3}/bin/thorium-sse3";
      };

      thorium-sse4 = {
        type = "app";
        program = "${self.packages.x86_64-linux.thorium-sse4}/bin/thorium-sse4";
      };

      default = self.apps.x86_64-linux.thorium-avx;
    };

    ##### aarch64-linux #####
    packages.aarch64-linux = {
      thorium = let
        pkgs = import nixpkgs { system = "aarch64-linux"; };
        name = "thorium";
        version = "126.0.6478.246 - 10";
        src = pkgs.fetchurl {
          url =
            "https://github.com/Alex313031/Thorium-Raspi/releases/download/M126.0.6478.246/Thorium_Browser_126.0.6478.246_arm64.AppImage";
          sha256 = "0g82i1j9jv9h2ch9rd67cl46rg8siyr55af9hp4jmmlh5gc5fhpc";
        };
        appimageContents = pkgs.appimageTools.extract { inherit name src; };
      in pkgs.appimageTools.wrapType2 {
        inherit name version src;
        extraInstallCommands = ''
          install -m 444 -D ${appimageContents}/thorium-browser.desktop $out/share/applications/thorium-browser.desktop
          install -m 444 -D ${appimageContents}/thorium.png $out/share/icons/hicolor/512x512/apps/thorium.png
          substituteInPlace $out/share/applications/thorium-browser.desktop \
          --replace 'Exec=thorium' 'Exec=${name} %U'
        '';
      };

      default = self.packages.aarch64-linux.thorium;
    };

    apps.aarch64-linux = {
      thorium = {
        type = "app";
        program = "${self.packages.aarch64-linux.thorium}/bin/thorium";
      };

      default = self.apps.aarch64-linux.thorium;
    };
  };
}
