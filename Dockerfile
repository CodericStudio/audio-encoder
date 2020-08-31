FROM alpine:latest
LABEL maintainer="Oliver Spryn"

# Install Pre-requisites
RUN apk --no-cache add curl jq unzip

# Install Watchman
RUN mkdir -p /usr/local/bin && \
    mkdir -p /usr/local/lib && \
    mkdir -p /usr/local/var/run/watchman

RUN cd / && \
    curl -L -o watchman.zip $(curl -s https://api.github.com/repos/facebook/watchman/releases/latest | jq -r ".assets[].browser_download_url" | grep -w linux) && \
    unzip watchman.zip && \
    mv watchman-*-linux watchman && \
    cp -r /watchman/bin/* /usr/local/bin && \
    cp -r /watchman/lib/* /usr/local/lib && \
    chmod 755 /usr/local/bin/watchman && \
    chmod 2777 /usr/local/var/run/watchman

# Cleanup
RUN rm /watchman.zip && rm -rf /watchman
RUN apk del curl jq unzip

ENTRYPOINT ["/usr/local/bin/watchman" "watch" "/usr"]
