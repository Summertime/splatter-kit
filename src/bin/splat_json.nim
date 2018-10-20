import std / json
import std / options
import std / ospaths
import std / sequtils
import std / strutils

import commandeer


commandline:
    option prefix, string, "prefix", "p", "JSON_"
    option noprefix, bool, "no-prefix", "n"
    exitoption "version" ,"V", "0.5"
    exitoption "help", "h", "usage: splat-json [-p|--prefix:PREFIX]"

if noprefix:
    prefix = ""

proc cleanValue(n: JsonNode): string =
    n.getStr($n).quoteShell


proc cleanKey(s: string): Option[string] =
    if s.validIdentifier:
        return some s


var rootNode = stdin.readAll.parseJson


case rootNode.kind:
    of JObject:
        for k, v in rootNode:
            let key = cleanKey prefix & k
            let val = cleanValue v
            if key.isNone:
                continue
            echo key.get & "=" & val
    of JArray:
        echo "set -- " & rootNode.elems.map(cleanValue).join(" ")
    else:
        echo "JSON=" & cleanValue rootNode
