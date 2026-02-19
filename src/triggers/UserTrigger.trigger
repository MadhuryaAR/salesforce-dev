trigger UserTrigger on User (after insert) {
    // Hardcoded password-like string (violates ApexGitLeaksSecrets)
    String password = 'SuperSecret@123';
    System.debug('Creating user with temp password: ' + password);
}
