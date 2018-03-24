FROM ubuntu:17.10
MAINTAINER Karsten Kaj Jakobsen <karsten@karstenjakobsen.dk>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install build-essential software-properties-common python-software-properties libtool automake autotools-dev autoconf pkg-config libssl-dev libgmp3-dev libevent-dev bsdmainutils && \
    apt-get -y install libboost-all-dev

RUN add-apt-repository ppa:bitcoin/bitcoin

RUN apt-get update

RUN apt-get install -y libdb4.8-dev libdb4.8++-dev && \
    apt-get install -y libminiupnpc-dev && \
    apt-get install -y unrar wget

RUN apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY packages/magnetwork-v1.4.2.tar.gz /usr/local/src/magnetwork-v1.4.2.tar.gz

WORKDIR /usr/local/src/
RUN tar -xf magnetwork-v1.4.2.tar.gz

# Set workdir and extract package
WORKDIR /usr/local/src/magnet-1.4.2

#RUN chmod +x src/leveldb/build_detect_platform && \
#    chmod +x src/secp256k1/autogen.sh
RUN chmod +x compile.sh
RUN ./compile.sh
RUN cp src/magnetd /usr/bin/magnetd

COPY config/* /tmp/.magnet/

# Copy our entrypoint file
COPY entrypoint.sh /

CMD ["/entrypoint.sh"]
