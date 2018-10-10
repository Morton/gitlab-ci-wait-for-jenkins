FROM alpine

RUN apk add --no-cache curl jq

COPY ./waitForJenkins.sh /bin/waitForJenkins
RUN chmod +x /bin/waitForJenkins

ENTRYPOINT waitForJenkins
