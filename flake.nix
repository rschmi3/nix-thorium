{
  description = "Thorium using Nix Flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs, ... }:
    {
      ##### x86_64-linux #####
      packages.x86_64-linux =
        let
          pkgs = import nixpkgs { system = "x86_64-linux"; };
        in
        {
          thorium-avx =
            let
              pkgs = import nixpkgs { system = "x86_64-linux"; };
              pname = "thorium-avx";
              version = "130.0.6723.174 - 62";
              src = pkgs.fetchurl {
                url = "https://github.com/Alex313031/thorium/releases/download/M130.0.6723.174/Thorium_Browser_130.0.6723.174_AVX.AppImage";
                sha256 = "23Vq+MDoV1ePkcVVy5SHWX6QovFUKxDdsgteWfG/i1U=";
              };
              appimageContents = pkgs.appimageTools.extract { inherit pname src version; };
            in
            pkgs.appimageTools.wrapType2 {
              inherit pname version src;
              extraInstallCommands = ''
                install -m 444 -D ${appimageContents}/thorium-browser.desktop $out/share/applications/thorium-browser.desktop
                cp -r ${appimageContents}/usr/share/icons $out/share
                substituteInPlace $out/share/applications/thorium-browser.desktop \
                --replace 'Exec=thorium' 'Exec=${pname}'
              '';
            };

          thorium-avx2 =
            let
              pkgs = import nixpkgs { system = "x86_64-linux"; };
              pname = "thorium-avx2";
              version = "130.0.6723.174 - 62";
              src = pkgs.fetchurl {
                url = "https://github.com/Alex313031/thorium/releases/download/M130.0.6723.174/Thorium_Browser_130.0.6723.174_AVX2.AppImage";
                sha256 = "Ej7OIdAjYRmaDlv56ANU5pscuwcBEBee6VPZA3FdxsQ=";
              };
              appimageContents = pkgs.appimageTools.extract { inherit pname src version; };
            in
            pkgs.appimageTools.wrapType2 {
              inherit pname version src;
              extraInstallCommands = ''
                install -m 444 -D ${appimageContents}/thorium-browser.desktop $out/share/applications/thorium-browser.desktop
                cp -r ${appimageContents}/usr/share/icons $out/share
                substituteInPlace $out/share/applications/thorium-browser.desktop \
                --replace 'Exec=thorium' 'Exec=${pname}'
              '';
            };

          thorium-sse3 =
            let
              pkgs = import nixpkgs { system = "x86_64-linux"; };
              pname = "thorium-sse3";
              version = "130.0.6723.174 - 62";
              src = pkgs.fetchurl {
                url = "https://github.com/Alex313031/thorium/releases/download/M130.0.6723.174/Thorium_Browser_130.0.6723.174_SSE3.AppImage";
                sha256 = "6qHCijDhAk7gXJ2TM774gVgW82AhexFlXFG1C0kfFoc=";
              };
              appimageContents = pkgs.appimageTools.extract { inherit pname src version; };
            in
            pkgs.appimageTools.wrapType2 {
              inherit pname version src;
              extraInstallCommands = ''
                install -m 444 -D ${appimageContents}/thorium-browser.desktop $out/share/applications/thorium-browser.desktop
                cp -r ${appimageContents}/usr/share/icons $out/share
                substituteInPlace $out/share/applications/thorium-browser.desktop \
                --replace 'Exec=thorium' 'Exec=${pname}'
              '';
            };

          thorium-sse4 =
            let
              pkgs = import nixpkgs { system = "x86_64-linux"; };
              pname = "thorium-sse4";
              version = "130.0.6723.174 - 62";
              src = pkgs.fetchurl {
                url = "https://github.com/Alex313031/thorium/releases/download/M130.0.6723.174/Thorium_Browser_130.0.6723.174_SSE4.AppImage";
                sha256 = "v5GGcu/bLJMc2f4Uckcn+ArgnnLL/jrT+01iw/105iY=";
              };
              appimageContents = pkgs.appimageTools.extract { inherit pname src version; };
            in
            pkgs.appimageTools.wrapType2 {
              inherit pname version src;
              extraInstallCommands = ''
                install -m 444 -D ${appimageContents}/thorium-browser.desktop $out/share/applications/thorium-browser.desktop
                cp -r ${appimageContents}/usr/share/icons $out/share
                substituteInPlace $out/share/applications/thorium-browser.desktop \
                --replace 'Exec=thorium' 'Exec=${pname}'
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
        thorium =
          let
            pkgs = import nixpkgs { system = "aarch64-linux"; };
            pname = "thorium";
            version = "126.0.6478.246 - 10";
            src = pkgs.fetchurl {
              url = "https://github.com/Alex313031/Thorium-Raspi/releases/download/M126.0.6478.246/Thorium_Browser_126.0.6478.246_arm64.AppImage";
              sha256 = "0g82i1j9jv9h2ch9rd67cl46rg8siyr55af9hp4jmmlh5gc5fhpc";
            };
            appimageContents = pkgs.appimageTools.extract { inherit pname src version; };
          in
          pkgs.appimageTools.wrapType2 {
            inherit pname version src;
            extraInstallCommands = ''
              install -m 444 -D ${appimageContents}/thorium-browser.desktop $out/share/applications/thorium-browser.desktop
              cp -r ${appimageContents}/usr/share/icons $out/share
              substituteInPlace $out/share/applications/thorium-browser.desktop \
              --replace 'Exec=thorium' 'Exec=${pname}'
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
