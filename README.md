# Security Baselines Store

Trzy gotowe moduły bezpieczeństwa oparte na Azure Policy i RGPD Art. 32:

### 1. Transmission Security Baseline  
   - HTTPS only, FTPS only, TLS ≥ 1.2 dla App Service.

### 2. Key Vault Resilience & Isolation Baseline  
   - Soft delete 90 dni, purge protection, private endpoint only.

### 3. Networking Perimeter Baseline  
   - NSG wymagane, brak publicznych IP, flow logs + Network Watcher.

### Każdy moduł zawiera:

```md
- Policy JSON,
- instrukcję wdrożenia (az cli / portal),
- scenariusz testowy „prove of done”.
```