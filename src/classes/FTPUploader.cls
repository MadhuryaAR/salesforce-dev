public with sharing class FTPUploader {
    // Hardcoded password (violates ApexGitLeaksSecrets)
    private static final String FTP_PASSWORD = 'MySecretPassword123!';

    public static void upload(Blob fileBody) {
        System.debug('Connecting to FTP with password: ' + FTP_PASSWORD);
    }
}
