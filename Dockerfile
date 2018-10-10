FROM alpine

RUN apk add --no-cache curl jq

WORKDIR /usr/src/app
COPY ./waitForJenkins.sh /usr/src/app/waitForJenkins.sh
RUN chmod +x /usr/src/app/waitForJenkins.sh
