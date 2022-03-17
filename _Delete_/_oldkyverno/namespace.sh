#! bin/bash

cat > base/resources/deployment/namespace.yaml <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: kyverno
EOF