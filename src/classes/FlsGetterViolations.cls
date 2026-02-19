public with sharing class FlsGetterViolations {
    public Account acc { get; set; }
    public List<Account> accs { get; set; }
    public static Account staticAcc;

    // V-01: simple field
    public String getName(){ return acc.Name; }                    // expect: FLS

    // V-02: multiple fields
    public String getInfo(){ return acc.Name + ':' + acc.Industry; } // expect: FLS

    // V-03: related field
    public String getOwnerName(){ return acc.Owner.Name; }         // expect: FLS

    // V-04: via SObject cast
    public String getNameViaVar(){
        SObject a = acc; 
        return ((Account)a).Name;                                  // expect: FLS
    }

    // V-05: conditional branches
    public String getNameOrIndustry(Boolean c){
        return c ? acc.Name : acc.Industry;                        // expect: FLS (both)
    }

    // V-06: early return
    public String getEarly(){ if(acc==null) return ''; return acc.Name; } // expect: FLS

    // V-07: helper in call chain
    public String getByHelper(){ return helper(); }
    private String helper(){ return acc.Name; }                    // expect: FLS (surfaced to getter)

    // V-08: string concat
    public String getGreeting(){ return 'Hi '+acc.Name; }          // expect: FLS

    // V-09: list index
    public String getFirst(){ if(accs==null||accs.isEmpty()) return ''; return accs[0].Name; } // FLS

    // V-10: custom field
    public String getCustom(){ return acc.Custom__c; }             // expect: FLS

    // V-11: static holder
    public String getStatic(){ return staticAcc.Name; }            // expect: FLS

    // V-12: transitive via property
    public Account getA(){ return acc; }
    public String getN(){ return getA().Name; }                    // expect: FLS

    // V-13: loop read
    public String getLastInLoop(){
        String last=''; for(Account a: accs) last=a.Name; 
        return last;                                               // expect: FLS
    }

    // V-14: null-coalescing style
    public String getCoalesced(){ return acc!=null ? acc.Name : ''; } // expect: FLS
}
