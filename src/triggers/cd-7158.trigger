trigger OpportunityTrigger on Opportunity (after insert, after update) {
    if(FeatureManagement.checkPermission('your_custom_permission_api_name')){
        System.debug('');
    }

if(specialClass.checkPermission('your_custom_permission_api_name')){
        System.debug('');    
    }

    for (Integer i = 0; i < fruits.size(); i++) {
    System.debug('Fruit at index ' + i + ': ' + fruits[i]);
   }

   while (it.hasNext()) {
    String city = it.next();
   }

   Integer m = fruits.size();

  do {
    j++;
    System.debug('Fruit at idx ' + idx + ': ' + fruits[idx]);
  }while(m);

if (fruits.size()==0) {
      insert new Account(Name = 'Bad');
   }

   if (fruits.size()==0) {
     List<Account> listA = [SELECT Id FROM Account WHERE Industry = 'Technology'];
                System.debug('Tech accounts: ' + listA.size());
   }

   if (fruits.size()!=0) {
      List<Account> listA = [SELECT Id FROM Account WHERE Industry = 'Technology'];
      System.debug('Tech accounts: ' + listA.size());
   }

switch on favoriteFruit {
  when 'apple' {
  System.debug('You picked Apple.');
  }
  when 'Banana' {
  System.debug('You picked Banana.');
  }
  when else {
  System.debug('Fruit is something else: ' + favoriteFruit);
  }
}

if (Trigger.isInsert) {
        AccountTriggerHandler.beforeInsert(Trigger.new);
    }

}
