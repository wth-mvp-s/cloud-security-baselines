# Versioning Header
**Doc ID :** SEC-RUNBOOK-LVT-001  
**Version :** 1.0.0  
**Date :** 2025-09-25  
**Owner :** Responsable Sécurité de l’Information (CISO)  
**Prochaine révision :** 2026-03-25  


# Synthèse Exécutive – Perte ou Vol de Téléphone Mobile (Impact MFA)

## Risque
Un téléphone perdu ou volé utilisé pour l’authentification (MFA) peut ouvrir l’accès aux systèmes de l’entreprise.  
Principaux risques : accès non autorisé, fuite de données, responsabilité RGPD, perte de confiance des clients.  

## Impact Business
- **Continuité** : l’utilisateur concerné peut perdre l’accès jusqu’au réenrôlement MFA.  
- **Clients / SLA** : possibles retards de service si des comptes sont compromis.  
- **Réputation / Coût** : amendes réglementaires (CNIL/RGPD), notifications aux clients, exposition juridique.  

## Réponse – 3 étapes clés
1. **Utilisateur** → Bloquer la SIM, signaler l’incident, déposer plainte en cas de vol.  
2. **IT** → Couper immédiatement l’accès : révoquer MFA, réinitialiser le mot de passe, fermer les sessions actives.  
3. **DPO / Management** → Évaluer l’exposition des données, décider d’une notification au régulateur et aux clients.  
