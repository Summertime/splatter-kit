import std / json
import std / ospaths
import commandeer

commandline:
    option prefix, string, "prefix", "p", ""
    exitoption "version" ,"V", "0.2"
    exitoption "help", "h", "usage: splat-json [-p|--prefix:PREFIX]"

for key, val in stdin.readAll.parseJson:
    let name = prefix & key
    if name != name.quoteShell():
        continue
    echo name & "=" & val.getStr($val).quoteShell()
