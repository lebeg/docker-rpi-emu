FROM ubuntu

MAINTAINER Ryan Kurte <ryankurte@gmail.com>
LABEL Description="Qemu based emulation for raspberry pi using loopback images"

# Update package repository
RUN apt-get update 

# Install required packages
RUN apt-get install -y --allow-unauthenticated \
    qemu \
    qemu-user-static \ 
    binfmt-support \
    parted \
    vim \
    emacs \
    python-pip \
    python-pip-whl

# Clean up after apt
RUN apt-get clean
RUN rm -rf /var/lib/apt

# Setup working directory
RUN mkdir -p /usr/rpi
WORKDIR /usr/rpi

COPY scripts/* /usr/rpi/

ADD mxnet-1.0.0-py2.py3-none-any.whl /usr/rpi/mxnet-1.0.0-py2.py3-none-any.whl
