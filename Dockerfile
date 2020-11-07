FROM alpine

ARG server_jar_url=https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar

RUN addgroup -g 1000 minecraft
RUN adduser -G minecraft --disabled-password --no-create-home --uid 1000 minecraft

RUN install -g minecraft -o minecraft -d /minecraft
RUN install -g minecraft -o minecraft -d /data

RUN apk add curl openjdk11-jre

USER minecraft

WORKDIR /minecraft

RUN curl --location "${server_jar_url}" --output server.jar

COPY resources/* .

CMD ./start.sh
