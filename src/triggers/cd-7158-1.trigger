trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {

    // Legend:
    // âœ… No Violation (allowed by AvoidLogicInTrigger)
    // âŒ Violation (should be flagged by AvoidLogicInTrigger)

    // ----------------------------------------------------------------------
    // Allowed: Trigger context guard + delegate
    // ----------------------------------------------------------------------
    if (Trigger.isAfter && Trigger.isInsert) {                     // âœ… No Violation
        OpportunityTriggerHandler.handleAfterInsert(Trigger.new);
    } else if (Trigger.isAfter && Trigger.isUpdate) {              // âœ… No Violation
        OpportunityTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.old);
    }

    if (Trigger.isBefore && Trigger.isInsert) {                    // âœ… No Violation
        OpportunityTriggerHandler.beforeInsert(Trigger.new);
    }

    new OpportunityTriggerHandler().run();                         // âœ… No Violation

    // ----------------------------------------------------------------------
    // Test locals
    // ----------------------------------------------------------------------
    String favoriteFruit = 'apple';
    List<String> fruits = new List<String>{ 'apple', 'banana', 'cherry' };

    // ----------------------------------------------------------------------
    // Loops in trigger body â†’ Violation
    // (Bodies include real statements so scanners wonâ€™t skip them)
    // ----------------------------------------------------------------------
    for (Opportunity o : Trigger.new) {                            // âŒ Violation (for-loop present)
        System.debug(o.Id);
    }

    Integer i = 0;
    while (i < 3) {                                                // âŒ Violation (while-loop present)
        i++;
    }

    Integer j = 0;
    do {                                                           // âŒ Violation (do-while present)
        j++;
    } while (j < 2);

    // ----------------------------------------------------------------------
    // switch / arbitrary if without Trigger.is â†’ Violation
    // ----------------------------------------------------------------------
    switch on favoriteFruit {                                      // âŒ Violation (switch logic in trigger)
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

    // ----------------------------------------------------------------------
    // Your config: fruits.size() is allow-listed â†’ No Violation
    // ----------------------------------------------------------------------
    if (fruits.size() == 0) {                                      // âœ… No Violation (per your allow-list)
        System.debug('No fruits');
    }

    // ----------------------------------------------------------------------
    // Permission-check guards now considered violations (per your request)
    // ----------------------------------------------------------------------
    if (FeatureManagement.checkPermission('your_custom_permission_api_name')) { // âŒ Violation
        System.debug('Permissioned guard only');
    }

    if (SpecialClass.checkPermission('your_custom_permission_api_name')) {      // âŒ Violation
        System.debug('Special guard only');
    }

    // ----------------------------------------------------------------------
    // Loops/SOQL/DML remain violations regardless of allow-listed methods
    // ----------------------------------------------------------------------
    for (Integer k = 0; k < fruits.size(); k++) {                  // âŒ Violation (for-loop always)
        System.debug('Fruit at index ' + k + ': ' + fruits[k]);
    }

    Iterator<String> it = fruits.iterator();
    while (it.hasNext()) {                                         // âŒ Violation (while-loop always)
        String item = it.next();
    }

    Integer idx = 0;
    do {                                                           // âŒ Violation (do-while always)
        idx++;
        System.debug('Fruit at idx ' + idx);
    } while (idx < fruits.size());

    if (fruits.size() == 0) {                                      // âŒ Violation (SOQL in trigger body)
        List<Account> listA = [SELECT Id FROM Account WHERE Industry = 'Technology'];
        System.debug('Tech accounts: ' + listA.size());
    }

    if (fruits.size() != 0) {                                      // âŒ Violation (SOQL in trigger body)
        List<Account> listB = [SELECT Id FROM Account WHERE Industry = 'Technology'];
        System.debug('Tech accounts: ' + listB.size());
    }

    if (fruits.size() == 0) {                                      // âŒ Violation (DML in trigger body)
        insert new Account(Name = 'Bad');
    }

    // ----------------------------------------------------------------------
    // Edge case: loop + Trigger.is inside still violates
    // ----------------------------------------------------------------------
    for (Opportunity o2 : Trigger.new) {                           // âŒ Violation (loop present)
        if (Trigger.isUpdate) {
            System.debug('Still a violation due to loop presence');
        }
    }
}
