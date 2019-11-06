# Version. Can change in build progress
ARG GCLOUD_SDK_VERSION=alpine

# Use google cloud sdk
FROM google/cloud-sdk:$GCLOUD_SDK_VERSION
MAINTAINER derit

# Install Java 8 for Datastore emulator
RUN apk add --update --no-cache openjdk8-jre &&\ 
    gcloud components install pubsub-emulator beta  --quiet

# Volume to persist Datastore data
VOLUME /opt/data

COPY start-pubsub .

EXPOSE 8085

ENTRYPOINT ["./start-pubsub"]