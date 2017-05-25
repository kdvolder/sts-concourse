#!/bin/bash
set -e
echo "==== creating temporary cf test space ===="
echo "PWD="`pwd`

source cf-test-space/env.sh

echo "====================="
echo "Delete space: ${CF_TEST_SPACE}"
echo "         org: ${CF_TEST_ORG}"
echo "---------------------"
cf login -a ${CF_TEST_API_URL} -u ${CF_TEST_USER} -p ${CF_TEST_PASSWORD} -o ${CF_TEST_ORG}
cf delete-space ${CF_TEST_SPACE} -f
echo "====================="
