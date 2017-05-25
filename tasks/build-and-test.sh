#!/bin/bash
set -e
workdir=`pwd` 

cd repo
#mvn -Pe46 package
xvfb-run mvn -Pe46 -Dsts.test.failure.ignore=false integration-test
