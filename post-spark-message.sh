#!/bin/bash

AUTH_BEARER=`cat ~/.spark/AUTH_BEARER`
ROOM_ID=$1 
MSG=$2

echo posting "$2 to $1"
curl -X "POST" "https://api.ciscospark.com/v1/messages" -H "Authorization: Bearer $AUTH_BEARER" -H "Content-Type: application/json" -d "{\"roomId\":\"$ROOM_ID\",\"text\":\"$MSG\"}"
