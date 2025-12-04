[return to main page](../README.md)

# Product 3 - Networking Baseline: oparty na politykach wbudowanych w Azure.
nie potrzeba custom policy, bo Microsoft ma prawie wszystko w tej domenie.

- minimalizacja ekspozycji ruchu
- brak wejścia z Internetu
- dowody kto/ skąd/ kiedy

> **Business value:**<br>- Mniej wektorów ataku z Internetu.<br>Szybsze dochodzenie po incydencie dzięki flow logs.



## Network interfaces should not have public IPs
All network ports should be restricted on network security groups associated to your virtual machine

## Subnets should be associated with a Network Security Group
Gateway subnets should not be configured with a network security group 

## Network Watcher should be enabled
Deploy network watcher when virtual networks are created
Network Watcher flow logs should have traffic analytics enabled

## Flow logs should be configured for every network security group
Configure network security groups to enable traffic analytics
Public IP addresses should have resource logs enabled for Azure DDoS Protection

Krok 2 – Przypisać je DO TWOJEJ SUBSKRYPCJI
Krok 3 – Wygenerować “Proof of Completion”
wdrażasz built-ins w trybie Audit → robisz compliance screenshots → to jest twój PoC i finalny dowód działania Product 3.

# HOW

1. Assign built-in Azure Policies:
   - "Network interfaces should not have public IPs"
   - "Subnets should be associated with a Network Security Group"
   - "NSG flow logs should be enabled"
   - "Network Watcher should be enabled"

2. Re-run compliance scan:
   Azure Portal → Policy → Compliance → Scan

3. Validate state via Evidence of Completion:
   - screenshot: overall compliance
   - screenshot: non-compliant resources

```Azure CLI
az account list --output table
rgid=$(az group show --resource-group <resourceGroupName> --query id --output tsv)
echo "$rgid"
definition=$(az policy definition list \
  --query "[?displayName=='Network Watcher should be enabled']".name \
  --output tsv)
az policy assignment create --name 'a1' --display-name 'dn1' --scope $rgid --policy $definition --description 'd1'
az policy assignment show --name "a1" --scope $rgid

```

```pwsh
$complianceparms = @{
ResourceGroupName = appname001-190-rg
PolicyAssignmentName = a2
Filter = 'IsCompliant eq false'
}

Get-AzPolicyState @complianceparms
```

rgid=$(az group show --resource-group appname001-190-rg --query id --output tsv)
definition=$(az policy definition list \
  --query "[?displayName=='Network Watcher should be enabled']".name \
  --output tsv)
az policy assignment create --name 'a2' --display-name 'dn2' --scope $rgid --policy $definition --description 'd2'

/////////////////////////
$thepolicy='Network Watcher should be enabled'
rgid=$(az group show --resource-group appname001-190-rg --query id --output tsv)
policyid=$(az policy assignment show --name $thepolicy$ --scope $rgid --query id --output tsv)

az policy state list --resource $policyid --filter "(isCompliant eq false)"
//////////////////////////2

$thepolicy='Network Watcher should be enabled'

az rest --method post --uri https://management.azure.com/subscriptions/d2eebf7f-7b6f-4b87-98d5-ac50a5e701da/resourceGroups/appname001-190-rg/providers/Microsoft.PolicyInsights/policyStates/latest/queryResults?api-version=2019-10-01 --uri-parameters `$filter="complianceState eq 'NonCompliant' and PolicyAssignmentName eq 'a2'"

--uri-parameters "`$filter=ComplianceState eq 'NonCompliant' and PolicyAssignmentName eq 'a2'"

 "/subscriptions/d2eebf7f-7b6f-4b87-98d5-ac50a5e701da/resourceGroups/appname001-190-rg/providers/Microsoft.Authorization/policyAssignments/a2",

 PolicyAssignmentId eq '/subscriptions/.../policyAssignments/a2'

 az rest --method post --uri https://management.azure.com/subscriptions/d2eebf7f-7b6f-4b87-98d5-ac50a5e701da/resourceGroups/appname001-190-rg/providers/Microsoft.PolicyInsights/policyStates/latest/queryResults?api-version=2019-10-01 
PolicyAssignmentId eq  "/subscriptions/d2eebf7f-7b6f-4b87-98d5-ac50a5e701da/resourceGroups/appname001-190-rg/providers/Microsoft.Authorization/policyAssignments/a2",

/////////works
az policy state summarize \
  --resource-group appname001-190-rg \
  -o json


/////works
az policy state summarize `
  -g appname001-190-rg `
  --query "policyAssignments[].{name:resourceId, nonCompliant:results.nonCompliantResources, compliant:results.compliantResources}" `
  -o table


///////////////////
az policy state summarize `
  -g appname001-190-rg `
  --query "policyAssignments[].{assignment:policyAssignmentId, nonCompliant:results.nonCompliantResources}" `
  -o table
//
az policy state summarize `
  -g appname001-190-rg `
  --query "policyAssignments[].{assignment:policyAssignmentId, nonCompliant:results.CompliantResources}" `
  -o table






////////////////////////////////

az account list --output table
rgid=$(az group show --resource-group appname001-190-rg --query id --output tsv)
echo "$rgid"
definition=$(az policy definition list \
  --query "[?displayName=='Network Watcher should be enabled']".name \
  --output tsv)
az policy assignment create --name 'name-Network-Watcher-should-be-enabled' --display-name 'display-name-Network-Watcher-should-be-enabled' --scope $rgid --policy $definition --description 'description-Network-Watcher-should-be-enabled'
az policy assignment show --name 'name-Network-Watcher-should-be-enabled' --scope $rgid


with all this, effect is AuditIfNotExists

is this policy is started ? what AuditIfNotExists means ? shouldnt it be better have state audit instead ? 

////////////////////////////////////////////
subId=$(az account show --query id -o tsv)

definition=$(az policy definition list \
  --query "[?displayName=='Network Watcher should be enabled']".name \
  -o tsv)

az policy assignment create \
  --name 'name-Network-Watcher-should-be-enabled' \
  --display-name 'display-name-Network-Watcher-should-be-enabled' \
  --scope "/subscriptions/$subId" \
  --policy $definition
