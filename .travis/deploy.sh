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
echo $GCLOUD_SERVICE_KEY_TEST | base64 --decode -i > ${HOME}/gcloud-service-key.json
echo $GCLOUD_SERVICE_KEY_TEST
cat ${HOME}/gcloud-service-key.json
echo "echo"
gcloud auth activate-service-account --key-file ${HOME}/gcloud-service-key.json
echo "gcloud"

echo "gcloud config set project $PROJECT_NAME"
echo "gcloud config set project ${PROJECT_NAME}"
# gcloud --quiet config set project $PROJECT_NAME
gcloud config set project \"$PROJECT_NAME\"
echo "gcloud PROJECT_NAME"
# gcloud --quiet config set container/cluster $CLUSTER_NAME_PRD
gcloud config set container/cluster $CLUSTER_NAME_PRD
echo "gcloud CLUSTER_NAME_PRD"
# gcloud --quiet config set compute/zone ${CLOUDSDK_COMPUTE_ZONE}
gcloud config set compute/zone ${CLOUDSDK_COMPUTE_ZONE}
echo "gcloud CLOUDSDK_COMPUTE_ZONE"
# gcloud --quiet container clusters get-credentials $CLUSTER_NAME_PRD
gcloud container clusters get-credentials $CLUSTER_NAME_PRD
echo "gcloud CLUSTER_NAME_PRD"

echo ""
# build and push
echo "# build and push"
IMAGE_NAME="gcr.io/${PROJECT_NAME}/${RC_NAME}"
echo "IMAGE_NAME"
IMAGE_NAME_FULL="${IMAGE_NAME}:${TRAVIS_COMMIT}"
echo "IMAGE_NAME_FULL"
docker build -t $IMAGE_NAME --rm .
echo "docker"
docker push $IMAGE_NAME
echo "docker"
docker tag $IMAGE_NAME $IMAGE_NAME_FULL
echo "docker"
docker push $IMAGE_NAME_FULL
echo "docker"
# gcloud docker push gcr.io/${PROJECT_NAME}/${RC_NAME}



yes | gcloud beta container images add-tag $IMAGE_NAME_FULL $IMAGE_NAME:latest

kubectl config view
kubectl config current-context

kubectl set image deployment/$RC_NAME $RC_NAME=$IMAGE_NAME_FULL