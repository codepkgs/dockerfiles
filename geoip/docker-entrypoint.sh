#!/bin/sh

if [ $# -eq 1 ]; then
    http --body https://api.ip.sb/geoip/$1
else
    http --body https://api.ip.sb/geoip
fi