public without sharing class AdminController {
    
    // Method to get all accounts, regardless of sharing rules
    public List<Account> getAllAccounts() {
        // This query will bypass the current user's sharing rules
        return [SELECT Id, Name FROM Account];
    }
    
    // Method to delete an account
    public void deleteAccount(Id accountId) {
        Account accToDelete = [SELECT Id FROM Account WHERE Id = :accountId];
        try {
            delete accToDelete; // This delete operation will bypass the current user's sharing rules
        } catch (DmlException e) {
            System.debug('Error deleting account: ' + e.getMessage());
        }
    }
}
