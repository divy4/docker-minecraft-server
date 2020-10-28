FROM alpine

ARG server_jar_url=https://launcher.mojang.com/v1/objects/f02f4473dbf152c23d7d484952121db0b36698cb/server.jar

WORKDIR /minecraft

RUN apk add curl openjdk11-jre

RUN curl --location "${server_jar_url}" --output server.jar

COPY resources/* .

CMD ./start.sh
