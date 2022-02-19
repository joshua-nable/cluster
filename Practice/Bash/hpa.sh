#!/bin/bash

#This will get a list of all PDB's from within the cluster. And output the namespace.
#But this doesn't look at those PDB's with only 1 pod available..

#pdb="$(kubectl get pdb --all-namespaces | awk '$3 ~ /^1/' | awk '{print $1}')"
pdb="$(kubectl get rs --all-namespaces | awk '$3 ~ /^1/' | awk '{print $1}')"


#Commenting this out as this might not do what I want
#pdb="$(kubectl get pdb --all-namespaces -o json | jq -r ".items[].metadata.namespace" | uniq)"

for namespace in $pdb ; do


#Name of the RS
#kubectl get rs -n $namespace | awk '$2 ~ /^1/' | awk '{print $1}'
#kubectl get rs -n $namespace | awk '$2 ~ /^1/'
kubectl get pdb -n $namespace | awk '$2 ~ /^1/'

# kubectl get rs $rset -o json | jq -r ".items[].metadata.namespace" | uniq

done



#Cluster name
#Namespace
#RS/PDB name