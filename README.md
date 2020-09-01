# Audio Encoder
[![Docker Build Status](https://img.shields.io/docker/cloud/build/oliverspryn/audio-encoder?label=Docker%20Build&logo=docker&logoColor=green)](https://hub.docker.com/r/oliverspryn/audio-encoder/builds)
[![Docker Automated build](https://img.shields.io/docker/cloud/automated/oliverspryn/audio-encoder?color=green&label=Docker%20Build&logo=docker&logoColor=green)](https://hub.docker.com/r/oliverspryn/audio-encoder/builds)
[![Docker Image Size](https://img.shields.io/docker/image-size/oliverspryn/audio-encoder?label=Image%20Size)](https://hub.docker.com/r/oliverspryn/audio-encoder)
[![Docker Image Version](https://img.shields.io/docker/v/oliverspryn/audio-encoder?label=Version)](https://hub.docker.com/r/oliverspryn/audio-encoder)
[![Docker Pulls](https://img.shields.io/docker/pulls/oliverspryn/audio-encoder?label=Docker%20Pulls)](https://hub.docker.com/r/oliverspryn/audio-encoder)
[![Docker Stars](https://img.shields.io/docker/stars/oliverspryn/audio-encoder?label=Docker%20Stars)](https://hub.docker.com/r/oliverspryn/audio-encoder)
[![Hit Counter](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fliteral-life-church%2Faudio-encoder)](https://github.com/literal-life-church/audio-encoder)

Docker image which watches a folder for new MP4 files, converts them to MP3, and drops them in an output location.

## Getting Started
This Docker image performs only one simple task. It converts all MP4s which are placed in one directory to MP3s and places them with the same name into another directory. This container uses a process called Watchman to run only whenever a new file is added to the input directory, and it immediately kicks off the conversion process.

The setup process is simple:

1.  Mount a folder on your host to the container path located at `/drop/in`. This is the input directory which is watched for new MP4 files.
2.  Mount another folder on your host to the path located `/drop/out`. This is the output directory where all converted MP3s show up.
3.  Run the container
4.  Place an MP4 file into the input directory on your host
5.  Wait a few moments
6.  Observe that the output directory has an MP3 file with the same name as the MP4 file

**Note:** This container does not perform any other kind of conversion except from MP4 to MP3. All other input file types are ignored.
