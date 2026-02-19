public class ContactFetcherBad {
    public void fetchContacts(List<Account> accounts) {
        for (Account acc : accounts) {
            // BAD: SOQL inside loop — can hit governor limits
            List<Contact> contacts = [SELECT Id FROM Contact WHERE AccountId = :acc.Id];
            // Process contacts...
        }
    }
}

public class AccountFetcherBad {
    public void fetchAccounts(List<Id> accountIds) {
        Integer i = 0;
        while (i < accountIds.size()) {
            Account a = [SELECT Name FROM Account WHERE Id = :accountIds[i]];
            // Do something with 'a'
            i++;
        }
    }
}
public class AccountProcessorBad {
    public void processAccounts() {
        do {
            String accId = getNextAccountId();
            Account acc = [SELECT Id, Name FROM Account WHERE Id = :accId];
            // Process acc
        } while (moreAccountsToProcess());
    }

    private String getNextAccountId() { /* implementation */ }
    private Boolean moreAccountsToProcess() { /* implementation */ }
}
public class CaseDebuggerBad {
    public void debugCaseSubjects(List<Id> caseIds) {
        for (Id caseId : caseIds) {
            // BAD: SOQL inside loop
            System.debug([SELECT Id, Subject FROM Case WHERE Id = :caseId].Subject);
        }
    }
}
