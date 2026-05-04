# ubuntu:16.04 is required — gcc-4.7 is not available in later releases
FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    build-essential \
    g++-4.7 \
    gcc-4.7 \
    make \
    cmake \
    autoconf \
    automake \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.7 20 \
 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.7 20 \
 && update-alternatives --set gcc /usr/bin/gcc-4.7 \
 && update-alternatives --set g++ /usr/bin/g++-4.7

ENV CC=gcc-4.7 CXX=g++-4.7

WORKDIR /usr/local/src/allpathslg
COPY . .

RUN mkdir build && cd build \
 && ../configure \
 && make -j$(nproc) \
 && make install \
 && make clean \
 && rm -rf /usr/local/src/allpathslg

WORKDIR /allpathslg

CMD ["bash"]
