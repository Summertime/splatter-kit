import std / json
import std / ospaths
import std / parseopt

proc err_badargs(): void =
    echo "splat-json [-p|--prefix:PREFIX]"
    quit 2

var prefix = ""

for kind, key, val in getopt():
    if (kind==cmdLongOption and key=="prefix" and val!="") or
       (kind==cmdShortOption and key=="p" and val!=""):
        prefix = val
        continue
    err_badargs()

for key, val in stdin.readAll.parseJson:
    echo prefix & key & "=" & val.getStr($val).quoteShell()
