#!/bin/bash

# Check the Seal Status
SEAL_STATUS=$(docker exec vault /bin/vault status | grep Sealed | awk '{ print $2 }')

if [[ "$SEAL_STATUS" == "true" ]]; then
    echo "The Vault is Sealed"
else
    echo "The Vault is Unsealed, Happy Secreting :)"
fi
