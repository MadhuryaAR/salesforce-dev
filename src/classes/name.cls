String primaryName;
String secondaryName = 'Acme';
String acctName = primaryName ?? secondaryName;
List<Account> accounts = [SELECT Name FROM Account WHERE Name = :acctName];
List<List<SObject>> moreAccounts = [
FIND :acctName
IN ALL FIELDS
RETURNING Account(Name)
];
