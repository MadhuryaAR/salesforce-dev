public with sharing class EncryptionHelper {
    // Embedded private key material (violates ApexGitLeaksSecrets)
    public static final String PRIVATE_KEY = '-----BEGIN PRIVATE KEY-----MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAMEXAMPLESECRETKEY-----END PRIVATE KEY-----';

    public static String sign(String payload) {
        // Fake sign just to keep file compilable
        return Crypto.generateDigest('SHA1', Blob.valueOf(payload)).toString();
    }
}
