public with sharing class PaymentGatewayService {
    // Hardcoded API key (violates ApexGitLeaksSecrets)
    private static final String API_KEY = 'sk_live_51J9GxYpAqEXAMPLEKEY1234567890abcdefghijk';

    public static void processPayment(Decimal amount) {
        // Usage of the secret (for demonstration only)
        System.debug('Processing ' + amount + ' with key ' + API_KEY);
    }
}
