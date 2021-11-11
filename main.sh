#!/bin/bash

./scripts/trim-ui.sh
./scripts/manipulateFoundation.sh
./scripts/mcm-postinstall.sh
./scripts/ldap.sh
./scripts/CloudFormsandOIDC.sh
./scripts/patch-im.sh

exit 0