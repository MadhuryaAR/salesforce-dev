public void processAccounts() {
    List<String> names = new List<String>{'Acme', 'GlobalTech', 'Innova'};
    List<Account> accs = [SELECT Id, Name FROM Account WHERE Name IN :names];
    
    Map<String, Account> nameToAccount = new Map<String, Account>();
    for (Account a : accs) {
        nameToAccount.put(a.Name, a);
    }

    for (String name : names) {
        Account acc = nameToAccount.get(name);
        System.debug('Found account: ' + acc);
    }
}
