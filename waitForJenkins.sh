#!/bin/sh

JOB_URL = $JENKINS_HOST/job/$(echo $CI_PROJECT_NAME | sed 's/\//%252F/g')/job/$(echo $CI_COMMIT_REF_NAME | sed 's/\//%252F/g')

echo Waiting for Jenkin\'s job $JOB_URL

while [ $(curl --insecure -sS $(curl --insecure -sS $JOB_URL/api/json | jq -r .builds[0].url)api/json | jq .building) == "true" ]
do
	sleep 3
done

if [ $(curl --insecure -sS $(curl --insecure -sS $JOB_URL/api/json | jq -r .builds[0].url)api/json | jq -r .result) == "SUCCESS" ]
then
	exit 0
fi

exit -1
