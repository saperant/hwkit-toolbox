ARG UBUNTU_VERSION
FROM docker.io/ubuntu:$UBUNTU_VERSION

ARG DEBIAN_FRONTEND=noninteractive
ARG BUILD_DATE
ARG VCS_REF
LABEL authoritative-source-url=ghcr.io \
      build-date="$BUILD_DATE" \
      maintainer="Saku Rantamäki <saku.rantamaki@iki.fi>" \
      name=saperant/hwkit-toolbox \
      summary="Toolbox container based on Ubuntu with HW tools installed" \
      url="https://github.com/saperant/hwkit-toolbox/" \
      usage="This image is meant to be used with the toolbox command" \
      vcs-ref="$VCS_REF" \
      vcs-url="https://github.com/saperant/hwkit-toolbox/"

ENV TZ=Europe/Helsinki

RUN dpkg --add-architecture i386

RUN apt-get update && \
    apt-get -y install \
        sudo \
        git \
        vim \
        tmux \
        libcap2-bin \
        build-essential \
        wget \
        yosys \
        iverilog \
        verilator \
        gtkwave \
        python3-pip \
        graphviz \
        ghdl && \
    apt-get clean

RUN python3 -m pip install \
    numpy \
    scipy \
    myhdl \
    cocotb \
    cocotb-test \
    cocotb-coverage \
    pytest \
    doit \
    pyuvm

