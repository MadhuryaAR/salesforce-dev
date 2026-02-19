public class SoqlInLoopTest {

    public void processAccounts() {
        AccountProcessor processor = new AccountProcessor();
        processor.processAccounts(); // invoking the overloaded method
    }

    public class AccountProcessor {
        
        // Method with the same name
        public void processAccounts() {
            List<String> names = new List<String>{'Acme', 'GlobalTech', 'Innova'};

            for (String name : names) {
                // SOQL inside loop — this violates the AvoidSoqlInLoops rule
                Account acc = [SELECT Id, Name FROM Account WHERE Name = :name LIMIT 1];
                System.debug('Found account: ' + acc);
            }
        }
    }
}
