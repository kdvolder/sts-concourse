#!/bin/bash
#branch=`git rev-parse --abbrev-ref HEAD`
branch=master
fly -t tools set-pipeline --var "branch=${branch}" --load-vars-from ${HOME}/.sts4-concourse-credentials.yml -p sts3-${branch} -c pipelines/pipeline.yml