public class AccountFetcherUnsafe {
    public static List<Account> fetchAccounts() {
        String userInput = ApexPages.currentPage().getParameters().get('accountId');
        String query = 'SELECT Id, Name FROM Account WHERE Id = \'' + userInput + '\'';
        List<Account> accs = Database.query(query);
        return accs;
    }
}
public class AccountSearchUnsafe {
    public void findAccounts(String searchKey) {
        String query = 'SELECT Id FROM Account WHERE Name LIKE \'%' + searchKey + '%\'';
        List<Account> results = Database.query(query);
        // do something with results
    }
}
public with sharing class AccountController {
    public String keyword { get; set; }

    public List<Account> search() {
        String q = 'SELECT Name FROM Account WHERE Name LIKE \'%' + keyword + '%\'';
        return Database.query(q);
    }
}
public with sharing class AccountFetcherSecure {
    
    // Property to hold user-supplied input
    public String userInput { get; set; }

    // Method using bind variable (RECOMMENDED)
    public List<Account> fetchAccountsWithBind() {
        userInput = ApexPages.currentPage().getParameters().get('accountId');

        if (String.isBlank(userInput)) {
            return new List<Account>();
        }

        // Safe: Using bind variable
        return [SELECT Id, Name FROM Account WHERE Id = :userInput];
    }

    // Method using escapeSingleQuotes() (for dynamic SOQL scenarios)
    public List<Account> fetchAccountsWithEscapedDynamicSOQL() {
        userInput = ApexPages.currentPage().getParameters().get('accountId');

        if (String.isBlank(userInput)) {
            return new List<Account>();
        }

        // Safe: Escaping single quotes in user input
        String safeInput = String.escapeSingleQuotes(userInput);
        String query = 'SELECT Id, Name FROM Account WHERE Id = \'' + safeInput + '\'';

        return Database.query(query);
    }
}
public with sharing class ContactSorterUnsafe {
    public List<Contact> sortContacts() {
        String sortField = ApexPages.currentPage().getParameters().get('sort');
        String query = 'SELECT Name FROM Contact ORDER BY ' + sortField;
        return Database.query(query);
    }
}
public with sharing class ContactSearcherUnsafe {
    public List<Contact> searchContacts() {
        String name = ApexPages.currentPage().getParameters().get('name');
        String query = 'SELECT Id FROM Contact WHERE Name LIKE \'%' + name + '%\'';
        return Database.query(query);
    }
}


public with sharing class ContactSorterUnsafe1 {
    public List<Contact> sortContacts() {
        String sortField = ApexPages.currentPage().getParameters().get('sort');
        String query = 'SELECT Name FROM Contact ORDER BY ' + sortField;
        return Database.query(query);
    }
}
public with sharing class ContactSearcherUnsafe {
    public List<Contact> searchContacts() {
        String name = ApexPages.currentPage().getParameters().get('name');
        String query = 'SELECT Id FROM Contact WHERE Name LIKE \'%' + name + '%\'';
        return Database.query(query);
    }
}
codescan
