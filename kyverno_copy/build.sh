#!/bin/bash

kubectl delete ns forge

rm -rf base

kustomize build . --enable-helm | kubectl-slice -o base/resources -t "{{.kind | lower}}/{{.metadata.name | alphanumdash}}.yaml"

rm -rf base/resources/pod

rm -rf charts

cd base && rm kustomization.yaml||true && touch kustomization.yaml && kustomize edit add resource resources/*/*.yaml

cd ..

cd overlays

kubectl create ns forge # only used locally when building this. Change the NS name to whatever you've declared on your values.yaml or kustomization.yaml in /overlays

kustomize build . | kubectl apply -f - 

echo "done"