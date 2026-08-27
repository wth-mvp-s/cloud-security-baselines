[//]: 003-artifact-compliance-networking-ReadMe

[return to main page](../README.md)

# Product 3 – Networking Perimeter Baseline

These controls reduce uncontrolled public exposure and improve network visibility.

## 1. Network Exposure

- Network interfaces should not have public IP addresses.
- Subnets should be associated with a Network Security Group.

## 2. Network Visibility

- Network Watcher should be enabled.
- Flow logs should be configured for every Network Security Group.
- A Log Analytics workspace is provisioned for network monitoring and analysis.


# Technical Documentation
```bash
az login
terraform init
terraform fmt -check
terraform validate
terraform apply   -var "order_num=0079004"   -var "subscription_id=$(az account show --query id -o tsv)"
```


[return to main page](../README.md)
