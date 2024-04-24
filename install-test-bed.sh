#!/usr/bin/env bash

set -e
set -o pipefail

kubectl apply -f https://raw.githubusercontent.com/cilium/cilium/main/examples/kubernetes/clustermesh/global-service-example/cluster1.yaml --context kind-kind-1
kubectl apply -f https://raw.githubusercontent.com/cilium/cilium/main/examples/kubernetes/clustermesh/global-service-example/cluster2.yaml --context kind-kind-2