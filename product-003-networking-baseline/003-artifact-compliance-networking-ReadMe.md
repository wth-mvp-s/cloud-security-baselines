[return to main page](../README.md)

# Product 3 - Networking Baseline: oparty na politykach wbudowanych w Azure.

> **Business value:**<br>Product 3 reduces Internet-based attack vectors and enables faster incident investigation through native network telemetry.<br>The artifact mitigates these risks by enforcing Microsoft-built networking policies that address the risks of uncontrolled network exposure, unintended Internet access, and lack of traffic traceability, without relying on custom policy logic.<br>Szybsze dochodzenie po incydencie dzięki flow logs.




# Final Completeness Check


# technical documentation
```azure
1. Network interfaces should not have public IPs
All network ports should be restricted on network security groups associated to your virtual machine

2. Subnets should be associated with a Network Security Group
Gateway subnets should not be configured with a network security group 

3. Network Watcher should be enabled
Deploy network watcher when virtual networks are created
Network Watcher flow logs should have traffic analytics enabled

4. Flow logs should be configured for every network security group
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