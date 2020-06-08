ARG BASE=ubuntu:18.04
FROM ${BASE}

USER root
WORKDIR /root
SHELL [ "/bin/bash", "-c" ]

RUN git clone https://github.com/nobiit/nano_dataset dataset && \
    cd dataset && \
    bash ./install.sh

ARG DISTRIBUTION=dlib
ARG VERSION=1.0.0
RUN wget "https://github.com/davisking/${DISTRIBUTION}/archive/v${VERSION}.tar.gz" && \
    tar -xf "v${VERSION}.tar.gz" && \
    rm -rf "v${VERSION}.tar.gz" source && \
    mv "${DISTRIBUTION}-${VERSION}" source-dlib

RUN cd source-dlib && \
    sed -i 's,forward_algo = forward_best_algo;,//forward_algo = forward_best_algo;,g' dlib/dnn/cudnn_dlibapi.cpp

RUN cd source-dlib && \
    pip wheel -v --no-clean . -w wheels

RUN scan-wheel "`pwd`/source-dlib/wheels/"

#RUN pip install wheels/*

RUN ls -l wheels
