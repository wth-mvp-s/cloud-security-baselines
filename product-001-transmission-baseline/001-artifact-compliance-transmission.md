[return to main page](../README.md)

# Product 1 – Transmission Security Baseline Artifact prevent: 
1. inconsistent security baselines 
2. downgrades to insecure TLS
3. accidental re-enable of HTTP or plain FTP
4. data in transit exposure

> **Business value:**<br>- Redukcja ryzyka wycieku danych w tranzycie.<br>- Oszczędność czasu na audycie: polityka centralna zamiast ręcznego sprawdzania każdej aplikacji.

# Artifact policies hardening transmission security operate across three layers:
- HTTPS
- FTPS
- TLS

# Artefact implements GDPR Articles 5 and 32.

  - Article 5(1)(e) – Storage limitation (personal data shall be kept no longer than necessary but long enough for accountability)
  - Article 32 – Security of processing

# HOW
```pwsh

az account list --output table

[//]az login --tenant <TENANT_ID_OR_DOMAIN>
[//]az account set --subscription <SUBSCRIPTION_ID>


[//]file path = /home/lt/_projects/security-audit-runbooks/artifacts



$subId = az account show --query id -o tsv
$subId
# insert from azure console
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
  --scope "/subscriptions/$subId"

```
# Evidence of Completion
(The screenshot + short explanation ) 

A non-compliant resource was intentionally created (???).
The assigned policy evaluated the resource and reported it as NonCompliant.
The screenshot below shows the failed rule and actual values detected.
This confirms the policy logic and the assignment are functioning correctly.

# resource creation command
```bash
OrderNum=0077002
rg="MyResourceGroup-$OrderNum"
planName="MyPlan-$OrderNum"
WebAppName="MyWebApp-$OrderNum"

az group create \
  --name $rg \
  --location westeurope

az appservice plan create \
  --resource-group $rg \
  --name $planName \
  --sku F1

az webapp create \
  --name $WebAppName \
  --resource-group $rg \
  --plan $planName

az webapp config set \
  --name $WebAppName \
  --resource-group $rg \
  --min-tls-version 1.0
```
# Current issue: 
some scope diffirence, policy do not see the resource created here, am I dont know yet why!!!

# delete old rg
```bash delete rg 
az group delete \
  --name OrderNum \
  --yes \
  --no-wait
```

```md
$rg="rg-test_2010.2025.1149";$plan="asp-test";$app="app-test-$((New-Guid).Guid.Substring(0,8))"
az group create -n $rg -l westeurope
az appservice plan create -n $plan -g $rg --sku F1 --is-linux
az webapp create -n $app -g $rg -p $plan --runtime "DOTNET:8"
az webapp update -g $rg -n $app --set httpsOnly=false   # expect RequestDisallowedByPolicy
```


[go to next module](../product-002-keyvault-baseline/002.artifact-compliance-key-vault.md)


checklist
- [ ] co jest ewidence de completiness, czy jak to by sie tam mialo nazywac?  