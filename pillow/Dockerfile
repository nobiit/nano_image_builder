ARG BASE=ubuntu:18.04
FROM ${BASE}

USER root
WORKDIR /root
SHELL [ "/bin/bash", "-c" ]

RUN git clone https://github.com/nobiit/nano_dataset dataset && \
    cd dataset && \
    bash ./install.sh

ARG DISTRIBUTION=pillow
ARG VERSION=1.0.0
RUN wget "https://github.com/python-pillow/${DISTRIBUTION}/archive/${VERSION}.tar.gz" && \
    tar -xf "${VERSION}.tar.gz" && \
    rm -rf "${VERSION}.tar.gz" source && \
    mv "${DISTRIBUTION^}-${VERSION}" source-pillow

RUN cd source-pillow && \
    pip wheel -v --no-clean . -w wheels

RUN scan-wheel "`pwd`/source-pillow/wheels/"

RUN pip install wheels/*

RUN ls -l wheels
