public List<Account> getAccounts(String userInput) {
    if (!userInput.matches('[a-zA-Z0-9 ]*')) {
        throw new IllegalArgumentException('Invalid input.');
    }
    return [SELECT Id, Name FROM Account WHERE Name = :userInput];
}
