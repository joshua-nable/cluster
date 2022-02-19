RELEASE ?= 1.5

clean-resources:
	rm -rf controller/
	rm -rf crds/
	rm -rf rbac/

update-resources: clean-resources
	curl -o resources.yaml https://raw.githubusercontent.com/kyverno/kyverno/release-$(RELEASE)/definitions/release/install.yaml
	kubectl slice -f resources.yaml -o ./
	mkdir controller/ crds/ rbac/
	mv configmap* deployment* namespace* poddisru* service-* controller/
	mv customresourcedefinition* crds/
	mv clusterrole* serviceaccount* rbac/
	cd crds; kustomize create --autodetect; cd ..
	cd rbac; kustomize create --autodetect; cd ..
	cd controller; kustomize create --autodetect; cd ..
	rm resources.yaml

download-policy:
	curl -o policies/$(POLICY).yaml https://raw.githubusercontent.com/kyverno/policies/main/$(POLICY).yaml
