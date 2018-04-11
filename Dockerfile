FROM ubuntu:17.10

LABEL maintainer="Daniel Baptista <danielbpdias@gmail.com>"

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Update the apt-get and installs curl
RUN apt-get update \
  && apt-get install -y curl

# Update node version on apt-get
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -

# Run simulated install to check latest package versions in repository
# RUN apt-cache policy \
#   python3 \
#   python3-pip \
#   python3-setuptools \
#   nodejs \
#   build-essential \
#   libzmq3-dev

# Installs node.js, python, pip and setup tools
RUN apt-get install -y \
    python3=3.6.3-0ubuntu2 \
    python3-pip=9.0.1-2 \
    python3-setuptools=36.2.7-2 \
    nodejs=9.11.1-1nodesource1 \
    build-essential=12.4ubuntu1 \
    libzmq3-dev=4.2.1-4ubuntu1

# Setup python language
ENV LANG en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8

# Upgrade pip
RUN pip3 install --upgrade pip

# Upgrade npm
RUN npm install npm@latest -g

# Install jupyter notebook
RUN pip3 install \
  jupyter==1.0.0 \
  jupyterlab==0.31.12

# Fix ipython kernel version
RUN ipython3 kernel install

# Install nodejs kernel
RUN npm config set user 0 \
 && npm config set unsafe-perm true \
 && npm install ijavascript -g

RUN ijsinstall --hide-undefined --install=global