#!/bin/bash

set -e

PROJECT_NAME="dcard-staging"
DCARD_KUBE_BRANCH="master"

case $TRAVIS_BRANCH in
  "prod")
    PROJECT_NAME="dcard-production"
    DCARD_KUBE_BRANCH="prod"
    ;;
esac

git clone git@github.com:Dcard/Dcard-Kube.git ~/Dcard-Kube --branch $DCARD_KUBE_BRANCH
~/Dcard-Kube/scripts/install.sh

patch_cron_job(){
  RC_NAME=$1
  DOCKER_FILE=$2
  IMAGE_NAME="gcr.io/${PROJECT_NAME}/${RC_NAME}"
  IMAGE_NAME_FULL="${IMAGE_NAME}:${TRAVIS_COMMIT}"
  docker build -t $IMAGE_NAME --file $DOCKER_FILE --rm .
  docker push $IMAGE_NAME
  docker tag $IMAGE_NAME $IMAGE_NAME_FULL
  docker push $IMAGE_NAME_FULL
  kubectl patch cronjob $RC_NAME --type='json' -p="[{'op': 'replace', 'path': '/spec/jobTemplate/spec/template/spec/containers/0/image', 'value': '${IMAGE_NAME_FULL}'}]"
}

patch_subscriber() {
  RC_NAME=$1
  DOCKER_FILE=$2
  SUBSCRIBER_IMAGE_NAME="gcr.io/${PROJECT_NAME}/${RC_NAME}-subscriber"
  SUBSCRIBER_IMAGE_NAME_FULL="${SUBSCRIBER_IMAGE_NAME}:${TRAVIS_COMMIT}"
  docker build -t $SUBSCRIBER_IMAGE_NAME --file ${DOCKER_FILE} --rm .
  docker push $SUBSCRIBER_IMAGE_NAME
  docker tag $SUBSCRIBER_IMAGE_NAME $SUBSCRIBER_IMAGE_NAME_FULL
  docker push $SUBSCRIBER_IMAGE_NAME_FULL
  kubectl set image deployment/$RC_NAME-subscriber $RC_NAME-subscriber=$SUBSCRIBER_IMAGE_NAME_FULL
}

# dice publisher part
patch_cron_job "dice-hawkeye" "Dockerfile.publisher"
patch_cron_job "dice-bd" "Dockerfile.publisher"

# dice subscriber part
patch_subscriber "dice-hawkeye" "Dockerfile.subscriber"
patch_subscriber "dice-bd" "Dockerfile.subscriber"%