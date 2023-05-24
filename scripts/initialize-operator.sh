#!/bin/bash

# Define the script working DIR
SCRIPT_DIR="$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
# Check the Initialization Status of the Operator
OPERATOR_INITIALIZE_STATUS=$(docker exec vault /bin/vault status | grep Initialized | awk '{ print $2 }')

# Initialize Operator if it is not yet initialized
if [[ "$OPERATOR_INITIALIZE_STATUS" == "true" ]]; then
    echo "Operator is already initialized, can't generate the Unseal Keys"
else
    echo "Initializing Operator:"
    echo "----------------------"
    echo "Generating Unseal Keys:"
    docker exec vault /bin/vault operator init > $SCRIPT_DIR/keys
    echo "The Operator has been initialized. Successfully"
    echo
    echo "Keys have been save under $SCRIPT_DIR/keys"
    echo
    echo "Please make sure to store the keys in a safe place"
fi
