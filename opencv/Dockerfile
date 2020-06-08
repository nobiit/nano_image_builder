ARG BASE=ubuntu:18.04
FROM ${BASE}

USER root
WORKDIR /root
SHELL [ "/bin/bash", "-c" ]

RUN git clone https://github.com/nobiit/nano_dataset dataset && \
    cd dataset && \
    bash ./install.sh

ARG DISTRIBUTION=opencv
ARG VERSION=1.0.0
RUN wget "https://github.com/opencv/${DISTRIBUTION}/archive/${VERSION}.tar.gz" && \
    tar -xf "${VERSION}.tar.gz" && \
    rm -rf "${VERSION}.tar.gz" && \
    mv "${DISTRIBUTION}-${VERSION}" source-opencv && \
    wget "https://github.com/opencv/${DISTRIBUTION}_contrib/archive/${VERSION}.tar.gz" && \
    tar -xf "${VERSION}.tar.gz" && \
    rm -rf "${VERSION}.tar.gz" && \
    mv "${DISTRIBUTION}_contrib-${VERSION}" source-opencv-contrib

RUN cd source-opencv && \
    mkdir build && \
    cd build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D INSTALL_C_EXAMPLES=ON \
        -D INSTALL_PYTHON_EXAMPLES=ON \
        -D OPENCV_GENERATE_PKGCONFIG=ON \
        -D OPENCV_EXTRA_MODULES_PATH=../../source-opencv-contrib/modules \
        -D BUILD_opencv_python2=OFF \
        -D BUILD_opencv_python3=ON \
        -D BUILD_JAVA=OFF \
        -D PYTHON3_EXECUTABLE=$(which python) \
        -D PYTHON3_LIBRARY=~/source/libpython3.6m.a \
        -D BUILD_EXAMPLES=ON ..

#RUN cd source-opencv && \
#    pip wheel -v --no-clean . -w wheels
#
#RUN scan-wheel "`pwd`/source-opencv/wheels/"
#
#RUN pip install wheels/*
#
#RUN ls -l wheels
