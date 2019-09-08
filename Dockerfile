FROM openjdk:8-jdk-slim

ARG PACK_URL 

RUN mkdir /atm
WORKDIR /atm

RUN apt-get update && apt-get install -y unzip wget iputils-ping

RUN wget -q -O pack.zip https://media.forgecdn.net/files/2756/981/ATM3-5.12.3_Server-FULL.zip && unzip pack.zip && rm pack.zip

RUN echo "eula=true" >> eula.txt && chmod -R 777 *



ENTRYPOINT bash -c 'echo -e "n\ny\n" | ./ServerStart.sh'






