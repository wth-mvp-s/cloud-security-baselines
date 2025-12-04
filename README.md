# Security Baselines Artifacts

Trzy gotowe moduły bezpieczeństwa oparte na Azure Policy i RGPD Art. 32:

[Product 1 – Transmission Security Baseline Artifact:](./product-001-transmission-baseline/001-artifact-compliance-transmission.md)
HTTPS only, FTPS only, TLS ≥ 1.2 dla App Service. 

[Product 2 - Key Vault Resilience & Isolation Baseline:](./product-002-keyvault-baseline/002.artifact-compliance-key-vault.md)
Soft delete 90 dni, purge protection, private endpoint only.

[Product 3 - Networking Perimeter Baseline:](./product-003-networking-baseline/003-artifact-compliance-networking.md)
NSG wymagane, brak publicznych IP, flow logs + Network Watcher.


### General structure

- what<br>
An artifact provides a clearly defined solution to a specific problem,
representing an immediate response to an existing use case within the company context.

- why<br>
problem description

- how
   - solution implementation instruction
   - idempotent when applicable

- RGPD article correspondance
- test ps1
- Evidence of Completion png
- Business value

### Artifacts Naming pattern
[ORDER-NUMBER]-[PREFIX]-[DOMAIN]-[TOPIC].[EXTENSION]



