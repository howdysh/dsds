FROM ubuntu:20.04

RUN apt update && apt-get update

RUN apt install -y openssh-server

RUN useradd -m -p 123456 howdout

RUN usermod -a -G root howdout

RUN usermod -a -G sudo howdout

RUN service ssh start
 

