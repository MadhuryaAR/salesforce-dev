
public without sharing class AccountSearch {

    /***************************************
  The constructor of the AccountSearch class directly assigns the value of query2, which is coming from outside the class to the query1 variable. 
  This means that an attacker could potentially manipulate the value of query2 to inject malicious SOQL queries.
  but since he is re assigned the static value in the method we should not give the violation.
    ***************************************/
        private static string query1;

        public AccountSearch(String query2){ 
            query1=query2;
        }


        public void searchInternalAccount(){

            query1 ='select id,Name,D_U_N_S__c,Billingcountry,billingstate,Type,account_status__c,recordtypeId,recordtype.name,BillingStateCode,billingcity,billingpostalcode,BillingStreet,billingcountrycode,Phone,website,owner.name from account where Id';
            List<account> sfdcaccList = new List<Account>();

            sfdcaccList = database.query(query1);

        }

}
