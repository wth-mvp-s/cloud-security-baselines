# Security Baselines Artifacts


The three Security Baseline artifacts bundle is designed to enable easy hardening of key security principle implementations.
Following Azure Policy and GDPR requirements, each artifact covers implementation instructions, mapping to GDPR articles, testing methods, and evidence of completion.
These artifacts are intended to serve as a valid audit tool while remaining simple to work with.


[Product 1 – Transmission Security Baseline Artifact:](./product-001-transmission-baseline/README.md)
HTTPS only, FTPS only, TLS ≥ 1.2 dla App Service. 

[Product 2 - Key Vault Resilience & Isolation Baseline:](./product-002-keyvault-baseline/README.md)
Soft delete 90 dni, purge protection, private endpoint only.

[Product 3 - Networking Perimeter Baseline:](./product-003-networking-baseline/README.md)
NSG wymagane, brak publicznych IP, flow logs + Network Watcher.


<!--
General structure

- business value
- what
- why
- how
- RGPD article correspondance
- test
- evidence of completion
- artifacts Naming pattern [ORDER-NUMBER]-[PREFIX]-[DOMAIN]-[TOPIC].[EXTENSION]

-->