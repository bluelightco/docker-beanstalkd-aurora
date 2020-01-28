FROM alpine:3.11

ENV AURORA_VERSION 2.2

RUN apk add --no-cache curl

RUN curl -L -o /tmp/aurora.tgz "https://github.com/xuri/aurora/releases/download/${AURORA_VERSION}/aurora_linux_amd64_v${AURORA_VERSION}.tar.gz" \
    && tar xvzf /tmp/aurora.tgz -C /tmp \
    && mv /tmp/aurora /usr/bin/ \
    && chmod +x /usr/bin/aurora \
    && rm -rf /tmp/*

COPY ["aurora.toml", "/"]

EXPOSE 3000

ENTRYPOINT ["/usr/bin/aurora", "-c", "/aurora.toml"]
