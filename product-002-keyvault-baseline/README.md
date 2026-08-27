[//]: 002-artifact-compliance-key-vault-ReadMe

[return to main page](../README.md)

# Product 2 – Key Vault Resilience Baseline
The following controls protect Key Vault resources against accidental or irreversible deletion.

## 1. Purge Protection
Azure Policy detects Key Vault resources without purge protection and reports them as `NonCompliant`.

## 2. Soft Delete and Retention Validation
The policy verifies that soft delete is enabled and that the retention period is at least 90 days.

## 3. Deny Enforcement
The deny policy prevents deployment of Key Vault resources that do not meet these requirements.


# Technical Documentation

Non-compliant resource 
```bash
az login
terraform init
terraform apply   -var "order_num=0079001"   -var "subscription_id=$(az account show --query id -o tsv)"

```
Policy definition & assignment
```bash

az account list --output table

# az login --tenant <TENANT_ID_OR_DOMAIN>
# az account set --subscription <SUBSCRIPTION_ID>
# file path = /home/lt/_projects/security-audit-runbooks/artifacts

subId=$(az account show --query id -o tsv)
echo "$subId"

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
Policy evaluation and non-compliance report.
```bash
az policy state list -g "MyResourceGroup-0078004" --query "[?policyDefinitionName=='002-artifact-compliance-key-vault-deny']"

az policy state list -g "MyResourceGroup-0078004" --query "[].complianceState"

az policy state list -g "MyResourceGroup-0078004" \
  --query "sort_by(@, &timestamp)[-1].complianceState"
```


[go to next module](../product-003-networking-baseline/README.md) 