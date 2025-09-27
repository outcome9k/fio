FROM openjdk:11-jre-slim

RUN apt update && apt install -y wget unzip
RUN wget https://github.com/v2fly/v2ray-core/releases/download/v5.7.0/v2ray-linux-64.zip
RUN unzip v2ray-linux-64.zip -d /v2ray

WORKDIR /app
COPY target/*.jar app.jar
COPY config.json /v2ray/config.json
COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
