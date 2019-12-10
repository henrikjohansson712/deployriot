#!/usr/bin/env bash
if [ "$#" -ne 1 ]; then
  echo "Usage ./deployriot.sh ENVIRONMENT" >&2
  exit 1
fi
export env=$1

export REPO=https://github.com/SciCatProject/riot-web.git


echo $1

if [ -d "./component/" ]; then
    cd component/
    git checkout master
    git pull
else
    git clone $REPO component
    cd component/
    git checkout master
fi
tag=$(git rev-parse HEAD)

echo "Deploying to Kubernetes"
cd ..
function docker_tag_exists() {
    curl --silent -f -lSL https://index.docker.io/v1/repositories/$1/tags/$2 > /dev/null
}

if docker_tag_exists dacat/scichat $tag; then
  echo exists
  helm upgrade riot-${env} riot --namespace=${env} --set image.tag=${tag}
  helm history riot-${env}
  echo "To roll back do: helm rollback --wait --recreate-pods riot-${env} revision-number"
else
  echo not exists
fi
