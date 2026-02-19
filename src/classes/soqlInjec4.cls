public List<Account> getAccounts(String userInput) {
    String query = 'SELECT Id, Name FROM Account WHERE Name = \'' + userInput + '\'';
    return Database.query(query); // Vulnerable to SOQL Injection
}
