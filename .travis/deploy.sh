#!/bin/bash

set -e

PROJECT_NAME="My First Project"
RC_NAME="my_django_react_template"

case $TRAVIS_BRANCH in
  "prod")
    PROJECT_NAME="My First Project-prod"
    ;;
esac

# auth
echo $GCLOUD_SERVICE_KEY_PRD | base64 --decode -i > ${HOME}/gcloud-service-key.json
gcloud auth activate-service-account --key-file ${HOME}/gcloud-service-key.json

gcloud --quiet config set project $PROJECT_NAME
gcloud --quiet config set container/cluster $CLUSTER_NAME_PRD
gcloud --quiet config set compute/zone ${CLOUDSDK_COMPUTE_ZONE}
gcloud --quiet container clusters get-credentials $CLUSTER_NAME_PRD

# build and push
IMAGE_NAME="gcr.io/${PROJECT_NAME}/${RC_NAME}"
IMAGE_NAME_FULL="${IMAGE_NAME}:${TRAVIS_COMMIT}"
docker build -t $IMAGE_NAME --rm .
docker push $IMAGE_NAME
docker tag $IMAGE_NAME $IMAGE_NAME_FULL
docker push $IMAGE_NAME_FULL
# gcloud docker push gcr.io/${PROJECT_NAME}/${RC_NAME}



yes | gcloud beta container images add-tag $IMAGE_NAME_FULL $IMAGE_NAME:latest

kubectl config view
kubectl config current-context

kubectl set image deployment/$RC_NAME $RC_NAME=$IMAGE_NAME_FULL