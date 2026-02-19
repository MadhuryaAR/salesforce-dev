public with sharing class LearnMoreController {
    @AuraEnabled(cacheable=true)
    public static List<Insurance_Product__mdt> getProducts() {
        List<Insurance_Product__mdt> products = [
            SELECT MasterLabel, Cost__c, Coverage_details__c 
            FROM Insurance_Product__mdt 
            WHERE Record_type__c = 'Debt Protection' 
            ORDER BY Cost__c DESC
        ];
        System.debug(products);
        return products;
    }
}
