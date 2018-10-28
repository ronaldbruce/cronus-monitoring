#!/bin/bash

IP=$(sudo kubectl get svc --namespace kube-system data-influxdb -o json | jq -r .spec.clusterIP)
URL="http://"$IP":8086"

echo "Showing Database List"
curl $URL"/query?q=show+databases"

echo "Showing CPU Data"
curl $URL"/query?q=select+*+from+telegraf..cpu"

echo "Showing KSM Data"
curl $URL"/query?q=select+*+from+telegraf..kube_pod_container_status_restarts_total"