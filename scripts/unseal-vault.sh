#!/bin/bash

# Define the script working DIR
SCRIPT_DIR="$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
# Check the Seal Status
SEAL_STATUS=$(docker exec vault /bin/vault status | grep Sealed | awk '{ print $2 }')

if [[ "$SEAL_STATUS" == "true" ]]; then
    echo "The Vault is Sealed"
    echo "Unsealing Vault now"
    KEYS=$(cat $SCRIPT_DIR/keys | grep "Unseal Key" |  awk '{ print $4 }')
    for key in $KEYS; do
      # Execute a command for each key
      echo "Unsealing Using Key: $key"
      docker exec vault /bin/vault operator unseal $key
    done
else
    echo "The Vault is Unsealed, Happy Secreting :)"
fi
