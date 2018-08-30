#!/bin/bash

exec 1> >(logger -s -t $(basename $0)) 2>&1

# Example host: https://hostname:8088/services/collector/event
host=""
# HEC Token taken from Splunk install
token=""

action=$sonarr_eventtype
title=$sonarr_series_title
release_season=$sonarr_release_seasonnumber
release_episode=$sonarr_release_episodenumbers
download_season=$sonarr_episodefile_seasonnumber
download_episode=$sonarr_episodefile_episodenumbers
file_size=$sonarr_release_size


if [[ "$action" = Grab ]]; then
    curl -k $host -H "Authorization: Splunk $token" -d '{"event":{"action":"'$action'","title":"'"$title"'","season":"'"$release_season"'","episode":"'"$release_episode"'","file size":"'"$file_size"'"}}'
    exit 0
elif [[ "$action" = Download ]]; then
    curl -k $host -H "Authorization: Splunk $token" -d '{"event":{"action":"'$action'","title":"'"$title"'","season":"'"$download_season"'","episode":"'"$download_episode"'"}}'
    exit 0
fi