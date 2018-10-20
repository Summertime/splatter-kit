import std / json
import std / options
import std / ospaths
import std / strformat
import std / strutils

import commandeer


commandline:
    option prefix, string, "prefix", "p", "JSON_"
    exitoption "version" ,"V", "0.2"
    exitoption "help", "h", "usage: splat-json [-p|--prefix:PREFIX]"


proc cleanValue(n: JsonNode): Option[string] =
    some n.getStr($n).quoteShell


proc cleanKey(s: string): Option[string] =
    if s.validIdentifier:
        return some s


var rootNode = stdin.readAll.parseJson


case rootNode.kind:
    of JObject:
        for k, v in rootNode:
            let key = cleanKey prefix & k
            let val = cleanValue v
            if key.isNone or val.isNone:
                continue
            echo &"{key.get}={val.get}"
    else:
        discard
