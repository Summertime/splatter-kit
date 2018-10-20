# splatter-kit

[![Build Status](https://travis-ci.org/Summertime/splatter-kit.svg)](https://travis-ci.org/Summertime/splatter-kit)

`splat_json` will "splat" a json object into a series of variable assignments in a format suitable for `eval`ing or `source`ing in a posix shell

## Warning!

Prior to 1.0 there will be no promise this application is safe to use (ONLY USE IT WITH TRUSTED SOURCES).

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
