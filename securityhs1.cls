public with sharing class Hotspot_SOQLInjection_TC {
    public static List<Account> searchAccounts() {
        String userInput = ApexPages.currentPage().getParameters().get('name');
        if (String.isBlank(userInput)) {
            userInput = 'Acme';
        }

        // BAD: concatenation into dynamic SOQL
        String q = 'SELECT Id, Name FROM Account WHERE Name LIKE \'%' + userInput + '%\'';
        List<Account> bad = Database.query(q);

        // GOOD: bind variable in static SOQL
        List<Account> good = [
            SELECT Id, Name
            FROM Account
            WHERE Name LIKE :('%' + userInput + '%')
        ];

        return bad.isEmpty() ? good : bad;
    }
}
