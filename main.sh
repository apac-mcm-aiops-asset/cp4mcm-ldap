#!/bin/bash

./scripts/mcm-postinstall.sh
./scripts/trim-ui.sh
./scripts/manipulateFoundation.sh
./scripts/ldap.sh
./scripts/CloudFormsandOIDC.sh
./scripts/patch-im.sh

exit 0