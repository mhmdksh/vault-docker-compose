# Hashicorp Vault on Docker-Compose
## Manage Vault
### Start the Vault
```
docker-compose up -d
```
### Stop the Vault
```
docker-compose down
```
## Automated Scripts
Use the below scripts to manage the vault
### Initialize the Operator
```
bash scripts/initialize-operator.sh
```
Note: The keys will be printed into a file called `keys`
### Unseal the vault
```
bash scripts/unseal-vault.sh
```
### Check the seal status of the vault
```
bash scripts/seal-status.sh
```
