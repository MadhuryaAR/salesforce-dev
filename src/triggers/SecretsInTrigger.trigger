trigger AccountTriggerWithFakeSecret on Account (before insert) {
    // ⚠️ FAKE PRIVATE KEY block for gitleaks testing — not real
    /*
    -----BEGIN PRIVATE KEY-----
    MIIBVwIBADANBgkqhkiG9w0BAQEFAASCAT8FAKEKEYEXAMPLEONLY1234567890
    -----END PRIVATE KEY-----
    */
}
