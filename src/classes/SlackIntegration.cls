public with sharing class SlackIntegration {
    // Hardcoded Slack bot token (violates ApexGitLeaksSecrets)
    public static final String ACCESS_TOKEN = 'xoxb-1234567890123-1234567890123-AbCdEfGhIjKlMnOpQrSt';

    public static void postMessage(String channel, String text) {
        System.debug('Posting to ' + channel + ' with token ' + ACCESS_TOKEN + ': ' + text);
    }
}
