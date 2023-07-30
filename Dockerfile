FROM alpine:3.18.2

COPY GRAVITY_VERSION /tmp
RUN apk add git gcc g++ make && \
    mkdir -p /opt && \
    cd /opt && \
    git clone https://github.com/marcobambini/gravity.git -b $(cat /tmp/GRAVITY_VERSION) && \
    cd gravity && \
    make && \
    cp gravity /usr/local/bin && \
    cd / && \
    rm -rf /opt/gravity
