#!/bin/bash

exec 1> >(logger -s -t $(basename $0)) 2>&1

# Example host: https://hostname:8088/services/collector/event
host=""
# Token taken from Splunk install
token=""

action=$sonarr_eventtype
title=$sonarr_series_title
season=$sonarr_release_seasonnumber
episode=$sonarr_release_episodenumbers
file_size=$sonarr_release_size


curl -k $host -H "Authorization: Splunk $token" -d '{"event":{"action":"'$action'","title":"'"$title"'","season":"'"$season"'","episode":"'"$episode"'","file size":"'"$file_size"'"}}'
