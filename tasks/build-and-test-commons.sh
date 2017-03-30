#!/bin/bash
set -e
workdir=`pwd` 

# So we can come back here
cd commons-git
mvn -Pe46 package

cd $workdir
timestamp=`date +"%s"`
file=`ls commons-git/org.springsource.ide.eclipse.commons.site/target/org.springsource.ide.eclipse.commons.site-*-SNAPSHOT.zip`
mv ${file%.zip} output/$(basename $file)-${timestamp}.zip

#cd commons-git
#xvfb-run mvn -Pe46 integration-test
