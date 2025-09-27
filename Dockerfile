FROM eclipse-temurin:11-jre-alpine

# Install V2Ray
RUN apk add --no-cache wget unzip
RUN wget https://github.com/v2fly/v2ray-core/releases/download/v5.7.0/v2ray-linux-64.zip -O /tmp/v2ray.zip && \
    unzip /tmp/v2ray.zip -d /usr/bin/v2ray && \
    chmod +x /usr/bin/v2ray/v2ray /usr/bin/v2ray/v2ctl && \
    rm /tmp/v2ray.zip

WORKDIR /app

# Copy application
COPY target/*.jar app.jar
COPY config.json /etc/v2ray/config.json
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

ENTRYPOINT ["/start.sh"]
