#!/bin/sh

url=$1

streamlink --twitch-disable-ads --twitch-low-latency --hls-live-edge=2 --hls-segment-stream-data --stream-segment-threads=4 --retry-streams 10 --retry-max 100 --retry-open 10 -p mpv $url best
