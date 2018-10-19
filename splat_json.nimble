# Package

version = "0.1"
author = "Summertime"
description = "Deserialization for the shell"
license = "Unlicense"

srcDir = "src"
binDir = "bin"
bin = @["splat_json"]
skipExt = @["nim"]

# Dependencies

requires "nim >= 0.18.0"
requires "commandeer >= 0.12.0"
