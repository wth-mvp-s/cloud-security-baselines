[//]: 002-artifact-compliance-key-vault-ReadMe

[return to main page](../README.md)

# Product 2 - Key Vault Resilience & Isolation Baseline

Key Vault faces the risks of irreversible secret loss, public exposure, and static-credential access. 
The artifact deals with these problems by using purge protection, private-only network access, and mandatory Managed Identity, the configuration makes deletions reversible, forces all traffic through a private path, and replaces stored credentials with verified identities. 


# Artefact implements GDPR Articles 5 and 32.
- Article 32 – Security of processing
- Article 5(1)(e) – Storage limitation (personal data shall be kept no longer than necessary but long enough for accountability)


# tdd

# technical documentation

Non-compliant resource 
```tf 
rm -rf .terraform
rm -f terraform.tfstate
rm -f terraform.tfstate.backup

az login
terraform init
terraform apply   -var "order_num=0079001"   -var "subscription_id=$(az account show --query id -o tsv)"

```
Policy definition & assignement
```pwsh

az account list --output table

# az login --tenant <TENANT_ID_OR_DOMAIN>
# az account set --subscription <SUBSCRIPTION_ID>
# file path = /home/lt/_projects/security-audit-runbooks/artifacts

$subId = az account show --query id -o tsv`
$subId`
subId=$(az account show --query id -o tsv)\
echo $subId\

code 002-artifact-compliance-key-vault-deny.json
cat 002-artifact-compliance-key-vault-deny.json

az policy definition create \
  --name "002-artifact-compliance-key-vault-deny" \
  --rules "./002-artifact-compliance-key-vault-deny.json" \
  --mode All \
  --subscription $subId

az policy assignment create \
  --name "002-artifact-compliance-key-vault-deny" \
  --policy "/subscriptions/$subId/providers/Microsoft.Authorization/policyDefinitions/002-artifact-compliance-key-vault-deny" \
  --scope "/subscriptions/$subId/resourceGroups/MyResourceGroup-0078004"
```
Policy resource evaluation and NonCompliance report.
```az cli 
az policy state list -g "MyResourceGroup-0078004" --query "[?policyDefinitionName=='002-artifact-compliance-key-vault-deny']"

az policy state list -g "MyResourceGroup-0078004" --query "[].complianceState"

az policy state list -g "MyResourceGroup-0078004" \
  --query "sort_by(@, &timestamp)[-1].complianceState"
```


[go to next module](../product-003-networking-baseline/README.md) 