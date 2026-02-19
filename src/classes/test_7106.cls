public with sharing class Foo {
    
    // Base queries as constants (no shadowing issues)
    private static final String BASE_QUERY_STAGE = 'SELECT Id FROM Opportunity WHERE StageName = ';
    private static final String BASE_QUERY_NAME  = 'SELECT Id, Name FROM Opportunity WHERE StageName = ';
    private static final String BASE_QUERY_AMOUNT = 'SELECT Id, Name, Amount FROM Opportunity WHERE StageName = ';
    private static final String BASE_QUERY_GENERIC = 'SELECT Id, Name FROM Opportunity WHERE ';

    // ----------------------------------------------------------
    // Example 1 - Simple query using stage
    // ----------------------------------------------------------
    public static List<Opportunity> getData(String stage) {
        String finalQuery = BASE_QUERY_STAGE + '\'' + stage + '\'';
        return Database.query(finalQuery);
    }

    // ----------------------------------------------------------
    // Example 2 - Query with additional fields
    // ----------------------------------------------------------
    public static List<Opportunity> getDataWithName(String stage) {
        String soql = BASE_QUERY_NAME + '\'' + stage + '\'';
        return Database.query(soql);
    }

    // ----------------------------------------------------------
    // Example 3 - Query with extra filter condition
    // ----------------------------------------------------------
    public static List<Opportunity> getClosedOpportunities(String stage, Decimal minAmount) {
        String soql = BASE_QUERY_AMOUNT + '\'' + stage + '\'' AND Amount > ' + minAmount;
        return Database.query(soql);
    }

    // ----------------------------------------------------------
    // Example 4 - Reuse base query for multiple methods
    // ----------------------------------------------------------
    public static List<Opportunity> getByStage(String stage) {
        String soql = BASE_QUERY_GENERIC + 'StageName = \'\'' + stage + '\'\'';
        return Database.query(soql);
    }

    public static List<Opportunity> getByOwner(Id ownerId) {
        String soql = BASE_QUERY_GENERIC + 'OwnerId = \'\'' + ownerId + '\'\'';
        return Database.query(soql);
    }
}
