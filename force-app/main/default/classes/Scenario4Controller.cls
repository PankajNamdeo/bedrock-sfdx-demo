public with sharing class Scenario4Controller {
    
    @AuraEnabled
    public static void closeHighPriorityTickets() {
        // High-level demo logic: Find all High Priority tickets and close them1
        List<Bedrock_Ticket__c> ticketsToUpdate = [
            SELECT Id, Status__c 
            FROM Bedrock_Ticket__c 
            WHERE Priority__c = 'High' AND Status__c != 'Closed'
            WITH SECURITY_ENFORCED
            LIMIT 50
        ];

        if (!ticketsToUpdate.isEmpty()) {
            for (Bedrock_Ticket__c t : ticketsToUpdate) {
                t.Status__c = 'Closed';
            }
            update ticketsToUpdate;
        }
    }
}