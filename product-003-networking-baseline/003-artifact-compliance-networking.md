[return to main page](../README.md)

# Networking perimeter:
    minimalizacja ekspozycji ruchu
    brak wejścia z Internetu
    dowody kto/ skąd/ kiedy
    dowody należytej staranności, wczesna detekcja na poziomie VNet
    ciągły nadzór — warunek dla logów/diag
    ograniczenie dostępu do niezbędnego minimum
    ciągłość usług = odporność

# enforce via built-in Azure Policy:

## Subnets should be associated with a Network Security Group
Gateway subnets should not be configured with a network security group 
```
Policy definition v : 3.0.0
    "policyRule": {
      "if": {
        "field": "type",
        "equals": "Microsoft.Network/virtualNetworks/subnets"
      },
      "then": {
        "effect": "[parameters('effect')]",
        "details": {
          "type": "Microsoft.Security/assessments",
          "name": "eade5b56-eefd-444f-95c8-23f29e5d93cb",
          "existenceCondition": {
            "field": "Microsoft.Security/assessments/status.code",
            "in": [
              "NotApplicable",
              "Healthy"
            ]
          }
        }
      }
    },
    "versions": [
      "3.0.0"
    ]
```
## Network interfaces should not have public IPs

## Flow logs should be configured for every network security group
Configure network security groups to enable traffic analytics
Public IP addresses should have resource logs enabled for Azure DDoS Protection

## Audit flow logs configuration for every virtual network
All flow log resources should be in enabled state

## Network Watcher should be enabled
Deploy network watcher when virtual networks are created
Network Watcher flow logs should have traffic analytics enabled

## Network interfaces should not have public IPs
All network ports should be restricted on network security groups associated to your virtual machine

