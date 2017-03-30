#!/bin/bash
set -e
xvfb-run mvn -Pe46 clean integration-test

timestamp=`date +"%s"`
file=`ls commons-git/org.springsource.ide.eclipse.commons.site/target/org.springsource.ide.eclipse.commons.site-*-SNAPSHOT.zip`
mv ${file%.zip} output/$(basename $file)-${timestamp}.zip