#!/bin/bash
set -e
workdir=`pwd` 

cd commons-git
mvn -Pe46 package
#xvfb-run mvn -Pe46 integration-test

cd $workdir
timestamp=`date +"%s"`
file=`ls commons-git/org.springsource.ide.eclipse.commons.site*/target/org.springsource.ide.eclipse.commons.site-*-SNAPSHOT.zip`
mv ${file%.zip} output/$(basename $file)-${timestamp}.zip
