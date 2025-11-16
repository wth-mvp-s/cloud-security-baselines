# Security Baselines Products

Trzy gotowe moduły bezpieczeństwa oparte na Azure Policy i RGPD Art. 32:

[Product 1 – Transmission Security Baseline:](./product-001-transmission-baseline/001-artifact-compliance-transmission.md)
HTTPS only, FTPS only, TLS ≥ 1.2 dla App Service. 

[Product 2 - Key Vault Resilience & Isolation Baseline:](./product-002-keyvault-baseline/002.artifact-compliance-key-vault.md)
Soft delete 90 dni, purge protection, private endpoint only.

[Product 3 - Networking Perimeter Baseline:](./product-003-networking-baseline/003-artifact-compliance-networking.md)
NSG wymagane, brak publicznych IP, flow logs + Network Watcher.


### general structure

1. what
An artifact provides a clearly defined solution to a specific problem,
representing an immediate response to an existing use case within the company context.

2. why
problem description

3. how
- solution implementation instruction
- idempotent when applicable

4. RGPD article correspondance
5. test ps1
6. proof png
7. Business value

### Artifacts Naming pattern:
[ORDER-NUMBER]-[PREFIX]-[DOMAIN]-[TOPIC].[EXTENSION]

### tools

- VC extension: Azure Policy - Azure resource, policy, and alias viewer
   Installation Identifier: azurepolicy.azurepolicyextension
   Version: 0.2.5
   Published: 5 years ago