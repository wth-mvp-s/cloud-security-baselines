
# Annex B – CNIL Notification Template

**Objet : Notification de violation de données personnelles – Perte/Vol de dispositif MFA**

**Destinataire :** Commission Nationale de l’Informatique et des Libertés (CNIL)  
**Expéditeur :** [Nom de l’organisation] – Responsable de traitement  
**Date d’envoi :** [JJ/MM/AAAA]  
**Contact DPO :** [Nom, e-mail, téléphone]

---

## 1. Description de l’incident
- Nature de l’incident : perte ou vol de téléphone utilisé pour l’authentification multifacteur (MFA).  
- Date et heure de l’incident : [JJ/MM/AAAA HH:MM].  
- Personne concernée : [employé / prestataire / utilisateur externe].  
- Circonstances de l’incident : [description succincte].  

## 2. Catégories de données personnelles concernées
- Identifiants (compte utilisateur, e-mail professionnel).  
- Données d’authentification (facteur secondaire MFA).  
- Autres données : [le cas échéant].  

## 3. Nombre approximatif de personnes concernées
- [Nombre ou estimation].  

## 4. Conséquences potentielles
- Risque d’accès non autorisé aux ressources internes (tenant Azure AD / SAS).  
- Risque de compromission d’identité.  
- Risque pour la confidentialité et l’intégrité des données personnelles.  

## 5. Mesures prises
- Révocation immédiate des sessions actives et jetons d’accès.  
- Réinitialisation des identifiants et réenrôlement MFA.  
- Analyse des journaux de sécurité sur les 7–30 derniers jours.  
- Renforcement des politiques de contrôle d’accès.  

## 6. Mesures correctives futures
- Sensibilisation des utilisateurs sur la sécurité des dispositifs MFA.  
- Mise à jour des politiques BYOD / gestion des terminaux.  
- Revue périodique des accès et des exceptions.  

---

**Déclaration faite par :**  
Nom : [Responsable Sécurité / DPO]  
Fonction : [Titre]  
Signature : [manuscrite ou électronique]

---

**Références juridiques :**  
Conformément à l’**article 33 du Règlement (UE) 2016/679 (RGPD)** relatif à la notification des violations de données à caractère personnel à l’autorité de contrôle, et, le cas échéant, à l’**article 34 RGPD** concernant la communication aux personnes concernées.  

**Transmission à :** Commission Nationale de l’Informatique et des Libertés (CNIL) – Autorité de contrôle compétente en France.
