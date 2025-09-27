#!/bin/bash

echo "🚀 Starting V2Ray + Spring Boot on Fly.io..."

# Start V2Ray in background
/usr/bin/v2ray/v2ray -config /etc/v2ray/config.json &

# Wait for V2Ray to start
sleep 5

# Set proxy environment
export JAVA_OPTS="$JAVA_OPTS -DsocksProxyHost=127.0.0.1 -DsocksProxyPort=1080 -Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=8081"

echo "✅ Starting Spring Boot application..."
exec java $JAVA_OPTS -jar app.jar
