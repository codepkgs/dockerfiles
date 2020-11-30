#!/bin/sh

APISERVER="https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_SERVICE_PORT"
CACRT="/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
TOKEN="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"

/usr/bin/kubectl proxy --server="$APISERVER" --certificate-authority="$CACRT" --token="$TOKEN" --accept-paths='^.*'
