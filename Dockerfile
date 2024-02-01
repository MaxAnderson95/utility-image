FROM ubuntu:latest

# Install packages
RUN apt update && apt upgrade -y
COPY apt-packages.txt /tmp
RUN apt install -y $(cat /tmp/apt-packages.txt | tr '\n' ' ')
RUN rm /tmp/apt-packages.txt
RUN curl -fsS https://pkgx.sh | sh

# Install go-sqlcmd
RUN curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc
RUN add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/prod.list)"
RUN apt-get update && apt-get install -y sqlcmd

# Install http-server cli
RUN npm install -g http-server

# Setup a user
ARG USERNAME=user
RUN useradd -ms /bin/bash $USERNAME
RUN usermod -aG sudo $USERNAME
RUN echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER $USERNAME
WORKDIR /home/$USERNAME