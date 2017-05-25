#!/bin/bash
set -e
workdir=`pwd` 

source cf-test-space/env.sh

cd repo
xvfb-run mvn -Pe46 -Dsts.test.failure.ignore=false integration-test
