#!/bin/bash

watchman watch-project /drop/in
watchman -- trigger /drop/in videofiles '*.mp4' -- /scripts/convert.sh
