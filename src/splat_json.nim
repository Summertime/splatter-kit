import std / json
import std / ospaths
import commandeer

commandline:
  option prefix, string, "prefix", "p", ""
  errormsg "splat-json [-p|--prefix:PREFIX]"

for key, val in stdin.readAll.parseJson:
    echo prefix & key & "=" & val.getStr($val).quoteShell()
