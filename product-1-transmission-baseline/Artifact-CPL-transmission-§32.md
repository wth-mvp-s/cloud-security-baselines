# WHAT

hardening transport security rules
- httpsOnly
- ftpsState
- minTlsVersion

# WHY

to prevent :
- inconsistent security baselines 
- downgrades to insecure TLS
- accidental re-enable of HTTP or plain FTP
- data in transit exposure

# How 

pwsh```

az account list --output table

[//]az login --tenant <TENANT_ID_OR_DOMAIN>
[//]az account set --subscription <SUBSCRIPTION_ID>


[//]file path = /home/lt/_projects/security-audit-runbooks/artifacts



$subId = az account show --query id -o tsv

az policy definition create `
  --name "Artifact-CPL-transmission" `
  --rules "/home/lt/_projects/security-audit-runbooks/artifacts/Artifact-CPL-transmission-§32.json" `
  --mode All `
  --subscription $subId

az policy assignment create `
  --name "Artifact-CPL-transmission-assignment" `
  --policy "/subscriptions/$subId/providers/Microsoft.Authorization/policyDefinitions/AppService-Lockdown" `
  --scope "/subscriptions/$subId"

# RGPD 
 → CNIL / RGPD Article 32 breach risk
Article 32 – Security of processing: ensures encryption in transit (confidentiality & integrity).


Problem → brak jednolitego wymuszenia HTTPS/TLS ≥ 1.2/FTPS Only
Artefakt → Artifact-CPL-transmission-§32.json

§ Artykol RODO / GDPR

Artykuł 32 — Bezpieczeństwo przetwarzania
Administrator i podmiot przetwarzający wdrażają odpowiednie środki techniczne i organizacyjne, aby zapewnić stopień bezpieczeństwa odpowiadający ryzyku, w tym m.in.
— lit. a) pseudonimizację i szyfrowanie danych osobowych,
— lit. b) zdolność do zapewnienia poufności, integralności, dostępności i odporności systemów i usług przetwarzania.

§ / € - bezposrednie przelozenie artefaktu	wedlog Artykulu 32: 
Wymuszenie HTTPS	art. 32 ust. 1 lit. b	zapewnienie poufności i integralności transmisji danych
Minimalna wersja TLS ≥ 1.2	art. 32 ust. 1 lit. b	redukcja ryzyka przechwycenia lub modyfikacji danych
FTPS Only	art. 32 ust. 1 lit. a + b	wymuszenie szyfrowanego kanału dla transferu plików
Centralne policy + enforce	art. 32 ust. 2	dowód zastosowania środków technicznych adekwatnych do ryzyka

∑ - prove of done 

$rg="rg-test_2010.2025.1149";$plan="asp-test";$app="app-test-$((New-Guid).Guid.Substring(0,8))"
az group create -n $rg -l westeurope
az appservice plan create -n $plan -g $rg --sku F1 --is-linux
az webapp create -n $app -g $rg -p $plan --runtime "DOTNET:8"
az webapp update -g $rg -n $app --set httpsOnly=false   # expect RequestDisallowedByPolicy