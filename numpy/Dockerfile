ARG BASE=ubuntu:18.04
FROM ${BASE}

USER root
WORKDIR /root
SHELL [ "/bin/bash", "-c" ]

RUN git clone https://github.com/nobiit/nano_dataset dataset && \
    cd dataset && \
    bash ./install.sh

ARG DISTRIBUTION=numpy
ARG VERSION=1.0.0
RUN wget "https://github.com/numpy/${DISTRIBUTION}/releases/download/v${VERSION}/${DISTRIBUTION}-${VERSION}.tar.gz" && \
    tar -xf "${DISTRIBUTION}-${VERSION}.tar.gz" && \
    rm -rf "${DISTRIBUTION}-${VERSION}.tar.gz" source && \
    mv "${DISTRIBUTION}-${VERSION}" source-numpy

RUN cd source-numpy && \
    pip wheel -v --no-clean . -w wheels

RUN scan-wheel "`pwd`/source-numpy/wheels/"

RUN pip install wheels/*

RUN ls -l wheels
