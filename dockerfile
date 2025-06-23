FROM codercom/code-server:latest

ARG GIT_EMAIL="example@example.com"
ARG GIT_USER="example"

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

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.147.9/hugo_extended_0.147.9_linux-arm64.deb
RUN dpkg -i hugo_extended_0.147.9_linux-arm64.deb
RUN rm hugo_extended_0.147.9_linux-arm64.deb

USER coder

ENV NVM_DIR=/home/coder/.nvm
ENV PATH=$NVM_DIR/bin:$PATH

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

RUN . "$NVM_DIR/nvm.sh" && nvm install 22

RUN mkdir /home/coder/.ssh
RUN chmod 700 /home/coder/.ssh
COPY --chown=coder ./ssh_keys/id_rsa "/home/coder/.ssh/"
COPY --chown=coder ./ssh_keys/id_rsa.pub "/home/coder/.ssh/"

RUN git config --global user.email ${GIT_EMAIL}
RUN git config --global user.name ${GIT_USER}

COPY .bash_aliases /home/coder

ENV CS_DISABLE_PROXY=true
