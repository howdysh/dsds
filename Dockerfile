FROM ubuntu:20.04

RUN apt update && apt-get update

RUN apt install -y curl openssh-server

RUN useradd -m -p 123456 howdout

RUN usermod -a -G root howdout

RUN usermod -a -G sudo howdout

RUN sed -i '15s/#Port 22/Port 2022/' /etc/ssh/sshd_config

RUN sed -i '34s/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN service ssh start

RUN curl https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -o ngrok-stable-linux-amd64.zip

RUN unzip ngrok-stable-linux-amd64.zip

RUN rm ngrok-stable-linux-amd64.zip

RUN ./ngrok authtoken 1wp5woFt0uVHoICT2eIFYJ2GdLF_6eQH53a58MA5CZD3v4xyM

RUN nohup ./ngrok tcp 2022 --region eu > /dev/null &
 

