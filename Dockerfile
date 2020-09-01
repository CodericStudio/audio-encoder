FROM ubuntu:latest
LABEL maintainer="Oliver Spryn"

# Install Watchman
RUN apt-get -qq update && apt-get install -qqy curl jq unzip

RUN mkdir -p /usr/local/bin && \
    mkdir -p /usr/local/lib && \
    mkdir -p /usr/local/var/run/watchman

RUN cd / && \
    curl -L -o watchman.zip $(curl -s https://api.github.com/repos/facebook/watchman/releases/latest | jq -r ".assets[].browser_download_url" | grep -w linux) && \
    unzip watchman.zip && \
    mv watchman-*-linux watchman

RUN cp -r /watchman/bin/* /usr/local/bin && \
    cp -r /watchman/lib/* /usr/local/lib

RUN chmod 755 /usr/local/bin/watchman && \
    chmod 2777 /usr/local/var/run/watchman

RUN rm /watchman.zip && rm -rf /watchman
RUN apt-get -qq --purge remove curl jq unzip

# Install ffmpeg
RUN apt-get -qq update && apt-get install -qqy ffmpeg

# Install scripts
COPY /scripts /scripts
RUN chmod -R 755 /scripts

ENTRYPOINT ["/scripts/start.sh"]
