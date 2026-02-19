public with sharing class ContactLogic {

    // Method to create a new Contact
    public static Contact createContact(String firstName, String lastName, String email, String phone) {
        Contact newContact = new Contact(
            FirstName = firstName,
            LastName = lastName,
            Email = email,
            Phone = phone
        );
        insert newContact;
        return newContact;
    }

    // Method to retrieve contacts by last name
    public static List<Contact> getContactsByLastName(String lastName) {
        return [
            SELECT Id, FirstName, LastName, Email, Phone
            FROM Contact
            WHERE LastName = :lastName
        ];
    }

    // Method to update a contact's email
    public static Boolean updateContactEmail(Id contactId, String newEmail) {
        Contact c = [SELECT Id, Email FROM Contact WHERE Id = :contactId LIMIT 1];
        c.Email = newEmail;
        update c;
        return true;
    }

    // Method to delete a contact by Id
    public static Boolean deleteContact(Id contactId) {
        try {
            Contact c = [SELECT Id FROM Contact WHERE Id = :contactId LIMIT 1];
            delete c;
            return true;
        } catch (Exception e) {
            System.debug('Error deleting contact: ' + e.getMessage());
            return false;
        }
    }

    // Method to list all contacts (use with caution in orgs with large data sets)
    public static List<Contact> listAllContacts(Integer limitSize) {
        return [
            SELECT Id, FirstName, LastName, Email, Phone
            FROM Contact
            LIMIT :limitSize
        ];
    }
}

public with sharing class MyController {

    // Properties for data binding in Visualforce page
    public Contact contactRecord { get; set; }
    public List<Contact> contactList { get; set; }
    public String searchLastName { get; set; }

    // Constructor
    public MyController() {
        contactRecord = new Contact();
        contactList = new List<Contact>();
    }

    // Method to save a new Contact
    public PageReference saveContact() {
        try {
            insert contactRecord;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Contact created successfully.'));
            contactRecord = new Contact(); // reset form
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error: ' + e.getMessage()));
        }
        return null;
    }

    // Method to search contacts by last name
    public PageReference searchCo
public with sharing class AcctCtrl {

    // Property to hold a new Account record
    public Account acct { get; set; }

    // List of Account records for display
    public List<Account> acctList { get; set; }

    // Search input
    public String searchName { get; set; }

    // Constructor
    public AcctCtrl() {
        acct = new Account();
        acctList = new List<Account>();
    }

    // Method to insert a new account
    public PageReference saveAccount() {
        try {
            insert acct;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account created successfully.'));
            acct = new Account(); // reset form
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(Ape
public with sharing class case_controller {

    // Property to hold a new Case record for creation
    public Case caseRecord { get; set; }

    // List to hold retrieved cases
    public List<Case> caseList { get; set; }

    // Search filter for subject
    public String searchSubject { get; set; }

    // Constructor
    public case_controller() {
        caseRecord = new Case();
        caseList = new List<Case>();
    }

    // Method to save a new case
    public PageReference saveCase() {
        try {
            insert caseRecord;

