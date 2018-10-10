#!/bin/sh

echo Waiting for Jenkin\'s job $JENKINS_HOST/job/$CI_PROJECT_NAME/job/$CI_COMMIT_REF_NAME

while [ $(curl --insecure -sS $(curl --insecure -sS $JENKINS_HOST/job/$CI_PROJECT_NAME/job/$CI_COMMIT_REF_NAME/api/json | jq -r .builds[0].url)api/json | jq .building) == "true" ]
do
	sleep 3
done

if [ $(curl --insecure -sS $(curl --insecure -sS $JENKINS_HOST/job/$CI_PROJECT_NAME/job/$CI_COMMIT_REF_NAME/api/json | jq -r .builds[0].url)api/json | jq -r .result) == "SUCCESS" ]
then
	exit 0
fi

exit -1
