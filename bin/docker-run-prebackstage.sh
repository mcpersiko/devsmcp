#!/bin/bash

TAG=$1
docker run -it -P -v /Users/mcp/projects/devsmcp/app:/app --name bark prebackstage:$TAG bash
