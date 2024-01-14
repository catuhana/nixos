let
  version = "1.20.4.385";
in (final: prev: {
  papermc = prev.papermc.overrideAttrs (old: {
    version = version;

    src =
      let
        mcVersion = prev.lib.versions.pad 3 version;
        buildNum = builtins.elemAt (prev.lib.splitVersion version) 3;
      in
      prev.fetchurl {
        url = "https://papermc.io/api/v2/projects/paper/versions/${mcVersion}/builds/${buildNum}/downloads/paper-${mcVersion}-${buildNum}.jar";
        hash = "sha256-SF/lf1vPcCUgq5sOZQYTmiznVmW4deh2RR8iJc3dny8=";
      };
  });
})
