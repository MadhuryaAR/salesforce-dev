public class OpportunityBusinessLogic {

    // Method to handle the logic of Opportunity stage change
    public static void handleOpportunityStageChange(List<Opportunity> opportunities) {
        List<Opportunity> oppToUpdate = new List<Opportunity>();
        
        // Loop through the Opportunities and apply logic
        for (Opportunity opp : opportunities) {
            // Example Business Logic - When Stage is "Closed Won"
            if (opp.StageName == 'Closed Won') {
                // Example: Set a custom field value or trigger additional actions
                opp.Custom_Field__c = 'Closed Successfully';
                
                // Example: Perform actions like sending an email, logging data, etc.
                // sendEmailNotification(opp);
            }
            // Example Business Logic - When Stage is "Closed Lost"
            else if (opp.StageName == 'Closed Lost') {
                // Example: Set a custom field value or trigger additional actions
                opp.Custom_Field__c = 'Lost Opportunity';
                
                // Example: Perform actions like sending an email, logging data, etc.
                // sendEmailNotification(opp);
            }

            // Add the Opportunity to the update list if it was modified
            if (opp.Custom_Field__c != null) {
                oppToUpdate.add(opp);
            }
        }

        // Update Opportunities that were modified
        if (!oppToUpdate.isEmpty()) {
            update oppToUpdate;
        }
    }
    
    // Example method to send email notification (Optional)
    private static void sendEmailNotification(Opportunity opp) {
        // You can use Messaging.SingleEmailMessage to send an email
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject('Opportunity Status Change');
        email.setPlainTextBody('The Opportunity ' + opp.Name + ' has changed status.');
        email.setToAddresses(new String[] { 'user@example.com' });
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
    }
}
