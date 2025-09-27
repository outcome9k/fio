#!/bin/bash
/v2ray/v2ray -config /v2ray/config.json &
sleep 3
java -jar app.jar
