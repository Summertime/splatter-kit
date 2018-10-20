import std / json
import std / ospaths
import commandeer

commandline:
    option prefix, string, "prefix", "p", ""
    exitoption "version" ,"V", "0.2"
    exitoption "help", "h", "usage: splat-json [-p|--prefix:PREFIX]"

for key, val in stdin.readAll.parseJson:
    if key != key.quoteShell():
        continue
    echo prefix & key & "=" & val.getStr($val).quoteShell()
