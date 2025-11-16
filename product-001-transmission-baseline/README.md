# Product 1 – Transmission Security Baseline

Co to robi:
Wymusza HTTPS only, FTPS only i TLS ≥ 1.2 dla App Service, żeby ruch nie leciał po http/ftp.

Problem: aplikacje chodzą na HTTP / słabym TLS.

Rozwiązanie: custom Azure Policy Artifact-CPL-transmission-§32.

Efekt: każdy webapp z httpOnly=false → RequestDisallowedByPolicy.






