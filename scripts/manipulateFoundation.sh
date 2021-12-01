#!/bin/bash

source scripts/lib/functions.sh

#
#
# Removing disabled Foundation elements 
#
#

echo "Removing disabled Foundation elements"

deployList="example-complianceapi-api-deploy example-complianceapi-monitor-deploy example-grcrisk gateway-kong ibm-kong-operator ibm-license-advisor-instance ibm-license-advisor-operator ibm-license-advisor-sender-instance ibm-license-advisor-sender-operator ibm-management-awspolicy-ansible ibm-management-hybridgrc-car  ibm-management-hybridgrc-core ibm-management-mcm-operator ibm-management-vmpolicy-ansible ibm-secure-tunnel-operator ibm-sre-bastion-operator ibm-sre-inventory-operator multicluster-hub-findingsapi multicluster-hub-grafeas multicluster-hub-grc-policy multicluster-hub-legato multicluster-hub-policy-adapter sre-inventory-inventory-aggregator sre-inventory-inventory-api sre-inventory-inventory-cfcollector sre-inventory-inventory-rhacmcollector sre-tunnel-controller sre-tunnel-tunnel-network-api sre-tunnel-tunnel-ui-mcmtunnelui example-complianceapi-monitor-deploy sre-bastion-sre-ui-mcmsreui sre-bastion-teleport-auth sre-bastion-teleport-proxy sre-bastion-bastion-backend-deploy"
statefulsetList="hybridgrc-postgresql sre-inventory-inventory-redisgraph sre-bastion-vault sre-bastion-postgresql"
replicaCount=0
ns="kube-system"

for deployItem in ${deployList}; do
	oc -n ${ns} scale deploy ${deployItem} --replicas=${replicaCount}
done
for statefulsetItem in ${statefulsetList}; do
	oc -n ${ns} scale statefulset ${statefulsetItem} --replicas=${replicaCount}
done
oc -n ${ns} delete job sre-inventory-inventory-redis-secret-job

echo "Completed scaling of deployments, statefulsets, and jobs"