#!/bin/bash
pdb="$(k get pdb --all-namespaces | awk '$5 ~ /^1/')"
for namespace in $pdb ; do
kubectl get pdb --all-namespaces | awk '$5 ~ /^0/' | grep $namespace 
done