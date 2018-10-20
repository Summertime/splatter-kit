import strutils

version = "0.5"
author = "Summertime"
description = "Deserialization for the shell"
license = "Unlicense"

srcDir = "src"
bin = @["bin/splat_json"]
skipExt = @["nim"]

requires "nim >= 0.18.0"
requires "commandeer >= 0.12.0"

before build:
    mkDir "bin"

task release, "Builds a release binary":
    exec [
        "nimble",
        "build",
        "--define:release",
        "--opt:speed",
        # Some things to knock down file size
        # Should be safe... ?
        # "--gc:none",
        # "--passC:-ffunction-sections",
        # "--passC:-fdata-sections",
        # "--passL:-Wl,--gc-sections",
    ].join(" ")
    exec "strip -s bin/*"
