import ospaths

version = "0.5"
author = "Summertime"
description = "Deserialization for the shell"
license = "Unlicense"

srcDir = "src"
bin = @["bin/splat_json"]
skipExt = @["nim"]

requires "nim >= 0.18.0"
requires "commandeer >= 0.12.0"

task travis, "":
    exec "nimble install -dy"
    # exec "nimble test"
    # exec "nimble release"
