First thing you need to do is install the following.

- Docker Desktop -  https://hub.docker.com/editions/community/docker-ce-desktop-windows
- WSL -             https://docs.microsoft.com/en-us/windows/wsl/install
- Homebrew -        https://brew.sh/
- Kubectl -         https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
- JQ -              https://formulae.brew.sh/formula/jq
- Kind -            https://kind.sigs.k8s.io/docs/user/quick-start/
- Kustomize         https://formulae.brew.sh/formula/kustomize


Kustomize is not needed here, but it is useful for building things. Before building anything you will need to run (or delete) the manualbuild.yaml file

rm -rf manualbuild.yaml

Run the following commands after deleting that file to get the cluster up and running

"kustomize build . > manualbuild.yaml" -- this will show you what is being built

"kustomize build . | kubectl apply -f -" -- this build whatever you've got. Any issues with files it will stop at that point, just keep that in mind.

To interact with the cluster you can run. For more commands just google it.

"kubectl get pods --all-namespaces" to see everything

"kubectl get pods -n kube-public" replacing kube-public with whatever namespaces you have

"kubectl get ns" to get a list of namespcaes

To get access to prometheus, you'll need to port-forward to the pod

kubectl get pods -n monitoring (take note of the prometheus-deployment and copy it)

kubectl port-forward -n *past it here* 9090:9090

localhost:9090 in your browser to access it.

https://grafana.com/docs/grafana/latest/installation/



** Please be patient while the chart is being deployed **

1. Get the application URL by running these commands:
    echo "Browse to http://127.0.0.1:8080"
    kubectl port-forward svc/grafana 8080:3000 &

2. Get the admin credentials:

echo "User: admin"
echo "Password: $(kubectl get secret grafana-admin --namespace grafana -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 --decode)"
joshua@JBROWN-MB cluster % helm repo search                                                                     

