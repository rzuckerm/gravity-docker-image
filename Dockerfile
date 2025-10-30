FROM alpine:3.22.2

COPY GRAVITY_* /tmp/
RUN apk add git gcc g++ make && \
    mkdir -p /opt && \
    cd /opt && \
    git clone https://github.com/marcobambini/gravity.git && \
    cd gravity && \
    git reset --hard $(cat /tmp/GRAVITY_COMMIT_HASH) && \
    make && \
    cp gravity /usr/local/bin && \
    cd / && \
    apk del git make && \
    rm -rf /opt/gravity
