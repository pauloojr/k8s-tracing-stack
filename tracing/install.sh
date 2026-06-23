#!/bin/bash

set -e

kubectl create namespace tracing --dry-run=client -o yaml | kubectl apply -f -

helm upgrade --install tempo grafana/tempo \
  --namespace tracing \
  --values tracing/values.yaml

kubectl get pods -n tracing