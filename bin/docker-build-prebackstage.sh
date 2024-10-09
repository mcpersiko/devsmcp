#!/bin/bash

TAG=$1
docker build -t prebackstage:$TAG -f build/Dockerfile .
