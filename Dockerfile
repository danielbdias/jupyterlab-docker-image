FROM ubuntu:18.04

LABEL maintainer="Daniel Baptista <danielbpdias@gmail.com>"

# Installs python, pip and setup tools
RUN apt-get update \
    && apt-get install -y \
    python3=3.6.4-1 \
    python3-pip=9.0.1-2 \
    python3-setuptools=38.4.0-1

# Setup python language
ENV LANG en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8

# Upgrade pip
RUN pip3 install --upgrade pip

# Install jupyter notebook
RUN pip3 install \
  jupyter==1.0.0 \
  jupyterlab==0.31.8

# Fix ipython kernel version
RUN ipython3 kernel install
