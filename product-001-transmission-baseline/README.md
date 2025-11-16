# Product 1 – Transmission Security Baseline

Co to robi:
Wymusza HTTPS only, FTPS only i TLS ≥ 1.2 dla App Service, żeby ruch nie leciał po http/ftp.

Problem: aplikacje chodzą na HTTP / słabym TLS.

Rozwiązanie: custom Azure Policy Artifact-CPL-transmission-§32.

Efekt: każdy webapp z httpOnly=false → RequestDisallowedByPolicy.





RGPD Art:
Article 32 – Security of processing
Article 5(1)(e) – Storage limitation (personal data shall be kept no longer than necessary but long enough for accountability)

> **Business value:**<br>- Redukcja ryzyka wycieku danych w tranzycie.<br>- Oszczędność czasu na audycie: polityka centralna zamiast ręcznego sprawdzania każdej aplikacji.

