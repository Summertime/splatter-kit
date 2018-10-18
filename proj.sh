#!/bin/sh

alias nimc='nim compileToC --hints:off --warnings:on'

case $1 in
    release)
        o=build/release
        rm --force --recursive $o
        mkdir --parents $o
        nimc --define:release --opt:speed -o:$o/splat-json src/splat_json.nim
        ;;
    debug)
        o=build/debug
        rm --force --recursive $o
        mkdir --parents $o
        nimc -o:$o/splat-json src/splat_json.nim
        ;;
esac
