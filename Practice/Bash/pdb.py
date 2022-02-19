#Get PDB's from all namespaces
#Store that as a variable and then run a loop with those namespaces against RS 
#Find the RS's that only have a min of 1
#do other things perhaps?



import os
import sys
get_namespaces="kubectl get pdb --all-namespaces -o json | jq -r '.items[].metadata.namespace' | uniq"
pdb = os.system(get_namespaces)
get_rs = "kubectl get rs -n", pdb

print (pdb)

for willy in str(pdb): 
       print (willy)