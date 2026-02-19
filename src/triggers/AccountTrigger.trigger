trigger AccountTrigger on Account (before insert) {
    // Hardcoded GitHub token (violates ApexGitLeaksSecrets)
    String authToken = 'ghp_abcd1234EXAMPLETOKENabcd1234abcd1234abcd';
    System.debug('Token used: ' + authToken);

    for (Account a : Trigger.new) {
        a.Description = 'Token used in debug (for test only)';
    }
}
