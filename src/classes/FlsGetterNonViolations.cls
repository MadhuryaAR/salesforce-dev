public with sharing class FlsGetterNonViolations {
    public Account acc { get; set; }

    // NV-01: stripInaccessible guard
    public String getNameStripped(){
        List<Account> recs = (List<Account>) Security.stripInaccessible(
            AccessType.READABLE, new List<Account>{ acc }
        ).getRecords();
        return recs.isEmpty() ? '' : recs[0].Name;                 // no FLS violation
    }

    // NV-02: describe-based guard
    public String getNameDescribe(){
        if (Account.Name.getDescribe().isAccessible()) return acc.Name;
        return '';                                                 // no FLS violation
    }

    // NV-03: SOQL inside getter (out of this rule’s scope)
    public String getViaSoql(){
        Account a = [SELECT Name FROM Account LIMIT 1];
        return a.Name;                                             // no violation (rule excludes SOQL-in-getter)
    }

    // NV-04: DML inside getter (out of this rule’s scope)
    public String doDml(){
        insert new Account(Name='x');
        return 'ok';                                               // no violation (rule excludes DML-in-getter)
    }

    // NV-05: no sObject field access
    public String getConst(){ return 'SAFE'; }                     // no violation

    // NV-06: return record (no direct field read) or guarded elsewhere
    public Account getRecord(Boolean permOk){ return permOk ? acc : null; } // no violation
}
