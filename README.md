# splatter-kit

[![Build Status](https://travis-ci.org/Summertime/splatter-kit.svg)](https://travis-ci.org/Summertime/splatter-kit)

*The tool that has been made thousands of times before, now in nim!*

This will "splat" a json object into a series of variable assignments, suitable for `eval`ing or `source`ing from a shell

## Warning!

Prior to 1.0 there will be no promise this application is safe to use (ONLY USE IT WITH TRUSTED SOURCES).

After 1.0, there will be no promise of safety unless this application is used correctly, and potentially with `--prefix:PREFIX` set to something sane.

As a result, the API might change before a 1.0 release (e.g. adding a default prefix value).

## Examples


### General usage
```
$ splat-json [-p|--prefix:PREFIX]
```
```bash
# bash:
. <( ... | splat_json )
# posix sh:
eval "$( ... | splat_json )"
```

### Weather in bash!
```bash
#!/bin/bash
URL='https://api.openweathermap.org/data/2.5/weather'
APIKEY='123abc'
. <( curl "$URL?q=London&appid=$APIKEY" | jq .main | splat_json )
echo Current temp: $JSON_temp
```

### Hacker news in dash!
```sh
#!/bin/sh
HNAPI='https://hacker-news.firebaseio.com/v0'
eval "$( curl $HNAPI/newstories.json | splat_json )"
for ID; do
    eval "$( curl $HNAPI/item/$ID.json | splat_json --prefix:HN_ )"
    echo "https://news.ycombinator.com/item?id=$HN_id $HN_title submitted by $HN_by"
done
```
