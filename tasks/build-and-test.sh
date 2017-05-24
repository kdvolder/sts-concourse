#!/bin/bash
set -e
workdir=`pwd` 

cd repo
#mvn -Pe46 package
xvfb-run mvn -Pe46 integration-test
