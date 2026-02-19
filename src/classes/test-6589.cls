public class SoqlMethodNameTest {

    public void execute() {
        // This is NOT recursion: it's calling another class’s method
        Helper helper = new Helper();
        helper.execute(); // same method name, but different class
    }

    public class Helper {
        public void execute() {
            List<String> names = new List<String>{'Acme', 'GlobalTech', 'Innova'};

            for (String name : names) {
                // This SOQL is inside a loop, but this method is not recursive.
                // Should trigger a violation only for SOQL-in-loop, not recursion.
                Account acc = [SELECT Id, Name FROM Account WHERE Name = :name LIMIT 1];
                System.debug('Found: ' + acc);
            }
        }
    }
}
