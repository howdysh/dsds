FROM ubuntu:20.04

RUN apt update && apt-get update

RUN apt install -y openssh-server

RUN useradd -m -p 123456 howdout

RUN usermod -a -G root howdout

RUN usermod -a -G sudo howdout

RUN sed -i '15s/#Port 22/Port 2022/' /etc/ssh/sshd_config

RUN sed -i '34s/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN service ssh start
RUN echo Done!
 

