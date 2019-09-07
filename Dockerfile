FROM openjdk:8-jdk-slim

ARG PACK_URL 

RUN mkdir /atm
WORKDIR /atm

RUN apt-get update && apt-get install -y unzip wget iputils-ping

RUN wget -O pack.zip $PACK_URL && unzip pack.zip && rm pack.zip

RUN echo "eula=true" >> eula.txt && chmod -R 777 *

RUN echo -e "n\ny\n" | ./ServerStart.sh

ENTRYPOINT bash -c "./ServerStart.sh"






