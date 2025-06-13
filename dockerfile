FROM codercom/code-server:latest

USER root

RUN apt-get update && apt-get install -y \
    curl \
    iputils-ping \
    python3 \
    python3-pip \
    build-essential \
    docker.io \
    htop \
    net-tools && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER coder

ENV NVM_DIR=/home/coder/.nvm
ENV PATH=$NVM_DIR/bin:$PATH

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

RUN . "$NVM_DIR/nvm.sh" && nvm install 22

RUN ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""

COPY .bash_aliases /home/coder

ENV CS_DISABLE_PROXY=true
