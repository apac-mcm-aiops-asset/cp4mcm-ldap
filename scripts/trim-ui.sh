#!/bin/bash

source scripts/lib/functions.sh

#
#
# Remove disabled UI elements 
#
#

echo "Removing disabled UI elements"

parent_idlist=" observe applications costs govern-risk monitor sre"
idlist=" overview clusters hybrid-applications content-runtimes chargeback license-advisor grc ma va monitor incidents infra-monitoring synthetics monitoring sre-incidents sre-bastion sre-sessionmgmt metering administer-monitoring administer-tunnel administer-tunnel-audit ${parent_idlist}"

for id in ${idlist}; do
	ids=($(oc get navconfigurations.foundation.ibm.com multicluster-hub-nav -n kube-system -o jsonpath='{.spec.navItems[*].id}'))
	i=0
	while [ $i -lt ${#ids[@]} ]; do
	    if [[ "${ids[i]}" == "${id}" ]]; then
		oc patch navconfigurations.foundation.ibm.com multicluster-hub-nav -n kube-system --type='json' -p '[{"op": "remove", "path": "/spec/navItems/'$i'"}]'
		echo "Found ${id} of id ${i}. Deleting it with return code $?." 
		break
	    fi
	    let i=i+1
	done
done
echo "Successfully removed disabled UI Elements"
