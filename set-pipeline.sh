#!/bin/bash
branch=`git rev-parse --abbrev-ref HEAD`
fly -t tools set-pipeline --load-vars-from ${HOME}/.sts4-concourse-credentials.yml -p sts3-commons -c commons-pipeline.yml