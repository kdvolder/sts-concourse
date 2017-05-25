#!/bin/bash
set -e
echo "==== creating temporary cf test space ===="
echo "PWD="`pwd`

CF_TEST_ORG=application-platform-testing

space_name=sts-$(date +"%Y%m%d")-$(cat /dev/urandom | tr -dc 'a-z' | fold -w 12 | head -n 1)
space_file=cf-test-space/space-name
space_env_file=cf-test-space/env.sh
echo space_name=${space_name}

cf login -a ${CF_TEST_API_URL} -u ${CF_TEST_USER} -p ${CF_TEST_PASSWORD} -o ${CF_TEST_ORG}
cf create-space ${space_name}
echo "Space created: " ${space_name}
echo $space_name > $space_file
echo "Space name saved to: " $space_file

echo "export CF_TEST_API_URL=${CF_TEST_API_URL}" > $space_env_file
echo "export CF_TEST_USER=${CF_TEST_USER}" >> $space_env_file
echo "export CF_TEST_PASSWORD=${CF_TEST_PASSWORD}" >> $space_env_file
echo "export CF_TEST_ORG=${CF_TEST_PASSWORD}" >> $space_env_file
echo "export CF_TEST_SPACE=${space_name}" >> $space_env_file

echo "Script to set env vars generated: ${space_env_file}"
echo "====================="
cat ${space_env_file}
echo "====================="
