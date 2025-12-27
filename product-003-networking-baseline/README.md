[//]: 003-artifact-compliance-networking-ReadMe

[return to main page](../README.md)

# Product 3 – Networking Baseline: No workload is exposed to the Internet without explicit control, and every flow becomes investigable after an incident, enforced through Microsoft network standards.

Business value:<br>Product 3 reduces Internet-based attack vectors and accelerates incident investigation through native network telemetry, without relying on custom policy logic.



# Final Completeness Check


# technical documentation
```azure
1.a Network interfaces should not have public IPs
    All network ports should be restricted on network security groups associated to your virtual machine

1.b Subnets should be associated with a Network Security Group
    Gateway subnets should not be configured with a network security group 

2.a Network Watcher should be enabled
    Deploy network watcher when virtual networks are created
    Network Watcher flow logs should have traffic analytics enabled

2.b. Flow logs should be configured for every network security group
    Configure network security groups to enable traffic analytics
    Public IP addresses should have resource logs enabled for Azure DDoS Protection
```

```tf 
rm -rf .terraform
rm -f terraform.tfstate
rm -f terraform.tfstate.backup

az login
terraform init
terraform fmt -check
terraform validate
terraform apply   -var "order_num=0079004"   -var "subscription_id=$(az account show --query id -o tsv)"
```


[return to main page](../README.md)
