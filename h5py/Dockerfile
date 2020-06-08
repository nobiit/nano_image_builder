ARG BASE=ubuntu:18.04
FROM ${BASE}

USER root
WORKDIR /root
SHELL [ "/bin/bash", "-c" ]

RUN git clone https://github.com/nobiit/nano_dataset dataset && \
    cd dataset && \
    bash ./install.sh

ARG DISTRIBUTION=h5py
ARG VERSION=1.0.0
RUN wget "https://github.com/h5py/${DISTRIBUTION}/releases/download/${VERSION}/${DISTRIBUTION}-${VERSION}.tar.gz" && \
    tar -xf "${DISTRIBUTION}-${VERSION}.tar.gz" && \
    rm -rf "${DISTRIBUTION}-${VERSION}.tar.gz" source && \
    mv "${DISTRIBUTION}-${VERSION}" source-h5py

RUN cd source-h5py && \
    pip wheel -v --no-clean . -w wheels

#RUN scan-wheel "`pwd`/source-h5py/wheels/"
#
#RUN pip install wheels/*
#
#RUN ls -l wheels
