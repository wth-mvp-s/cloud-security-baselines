[//]: 001-artifact-compliance-transmission-ReadMe

[return to main page](../README.md)

# Product 1 – Transmission Security Baseline

This artifact provides technical evidence supporting GDPR confidentiality-in-transit requirements (Art. 5(1)(f)) and security of processing (Art. 32).
Controls enforced:<<keep
- minTlsVersion → prevents downgrade to insecure TLS.
- httpsOnly → enforces encrypted HTTP transport.
- ftpsState → blocks plaintext FTP and accidental re-enable of insecure channels.

How this supports GDPR:
Art. 5(1)(f) — these controls ensure integrity and confidentiality during transmission.
Art. 32 — they constitute measurable safeguards demonstrating that data in transit is protected through enforced secure protocols.

> **Business value:**<br>- Redukcja ryzyka wycieku danych w tranzycie.<br>- Oszczędność czasu na audycie: polityka centralna zamiast ręcznego sprawdzania każdej aplikacji.


# Audit
1. Expected vs Actual (HTTPS)
Policy read httpsOnly=false and flagged NonCompliant because expected value is true.
2. Expected vs Actual (FTPS)
Policy read ftpsState="" and flagged NonCompliant because expected value is FtpsOnly.
3. Rule and Scope Validation
Policy was applied to the correct resource type (Microsoft.Web/sites) and evaluated the intended fields (httpsOnly, siteConfig.ftpsState), confirming accurate rule execution.

# Final Completeness Check
The CLI output and the portal both report the same resource as NonCompliant for the same reasons, which establishes that the policy definition and assignment are functioning consistently across both evaluation engines.

Shows the failed rule and actual values detected:
- guest view-Screenshot from 2025-12-08 16-23-40.png
- guest view-Screenshot from 2025-12-08 16-40-41.png

Shows the failed state for compliance using az cli:
- Screenshot from 2025-12-10 10-53-00.png

# technical documentation

Non-compliant resource 
```tf 
rm -rf .terraform
rm -f terraform.tfstate
rm -f terraform.tfstate.backup

az login
terraform init
terraform apply   -var "order_num=0077015"   -var "subscription_id=$(az account show --query id -o tsv)"

```
Policy definition & assignement
```pwsh

az account list --output table

# az login --tenant <TENANT_ID_OR_DOMAIN>
# az account set --subscription <SUBSCRIPTION_ID>
# file path = /home/lt/_projects/security-audit-runbooks/artifacts

$subId = az account show --query id -o tsv
$subId

code 001-artifact-compliance-transmission-audit.json
cat 001-artifact-compliance-transmission-audit.json

az policy definition create `
  --name "001-artifact-compliance-transmission-audit" `
  --rules "./001-artifact-compliance-transmission-audit.json" `
  --mode All `
  --subscription $subId

az policy assignment create `
  --name "001-artifact-compliance-transmission-audit" `
  --policy "/subscriptions/$subId/providers/Microsoft.Authorization/policyDefinitions/001-artifact-compliance-transmission-audit" `
  --scope "/subscriptions/$subId/resourceGroups/MyResourceGroup-0077008"
```
Policy resource evaluation and NonCompliance report.
```az cli 
az policy state list -g "MyResourceGroup-0077008" --query "[?policyDefinitionName=='001-artifact-compliance-transmission-audit']"

az policy state list -g "MyResourceGroup-0077008" --query "[].complianceState"

az policy state list -g "MyResourceGroup-0077008" \
  --query "sort_by(@, &timestamp)[-1].complianceState"
```


[go to next module](../product-002-keyvault-baseline/README.md)


