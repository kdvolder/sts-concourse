#!/bin/bash
set -e
workdir=`pwd` 

source cf-test-space/env.sh

cd repo
xvfb-run mvn -Pe46 -Dsts.test.failure.ignore=false integration-test

# We will likely get more stable test builds if we snapshot the maven cache from
# a successful build and reuse that for the next build. This might avoid some
# of the issues we see around tests failing with corrupt maven repo.
cd ${workdir}
timestamp=`date +%s`
tarfile=${workdir}/mvn-cache/sts3-${timestamp}.tar.gz
tar -czvf ${tarfile} -C ${HOME} .m2/repository

