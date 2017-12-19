#!/bin/bash
set -e
workdir=`pwd` 

function finish {

    # Grab any surefire reports so we can save it for later inspection
    tarfile=${workdir}/test-reports/test-reports-${eclipse_profile}-${timestamp}.tar.gz
    cd $workdir/repo
    tar -czf ${tarfile} `find . -name surefire-reports`

    # Grab contents of tmp dir so we can save it for later inspection
    tarfile=${workdir}/tmp/tmp-${timestamp}.tar.gz
    tar -czf ${tarfile} /tmp
}
trap finish EXIT

if [ -d "mvn-cache" ]; then
    echo "Prepopulating maven cache"
    tar xzf mvn-cache/*.tar.gz -C ${HOME}
else
   echo "!!!No stored maven cache found!!! "
   echo "!!!This may slow down the build!!!"
fi

source cf-test-space/env.sh

cd repo
xvfb-run mvn -P${eclipse_profile} -Dsts.test.failure.ignore=false integration-test

# We will likely get more stable test builds if we snapshot the maven cache from
# a successful build and reuse that for the next build. This might avoid some
# of the issues we see around tests failing with corrupt maven repo.
cd ${workdir}
timestamp=`date +%s`
tarfile=${workdir}/mvn-cache-out/sts3-${eclipse_profile}-${timestamp}.tar.gz
tar -czf ${tarfile} -C ${HOME} .m2/repository



