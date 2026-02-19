public class SOQLInjectionSafeExample {
    public static List<Account> getAccounts(String userInput) {
        return [SELECT Id, Name FROM Account WHERE Name = :userInput]; // ✅ Secure Bind Variable
    }
}
