public class RelatedObjectClass{
//the below shown result is when u set system mode as false 
//when u set system mode as true u will get erroe only for last 3rd one
 
//violations should be thrown for both SH_Sub_Regions__r,SH_Region__c 
    public void foo(){
      Map<Id,SH_Region_c> shRegionMap = new Map<Id,SH_Region___c>();
      shRegionMap = new Map<Id, SH_Region__c>([
      select id,name, (select id,name from SH_Sub_Regions__r) from SH_Region__c where id in :regionIdSet WITH SYSTEM_MODE ]);
     }
 
//violation should not be thrown as objects are declared
    public void foo(){
      Map<Id,SH_Region_c> shRegionMap = new Map<Id,SH_Region___c>();
      if(Schema.sobjectType.SH_Regon__c.isAccessible() && Schema.sobjectType.SH_Sub_Rgion__c.isAccessible()){
      shRegionMap = new Map<Id, SH_Region__c>([
      select id,name, (select id,name from SH_Sub_Rgions__r) from SH_Regon__c where id in :regionIdSet WITH SYSTEM_MODE ]);
     }
     }
 
//SH_Sub_Regions__r should get violation as it is not defined
    public void foo2(){
      Map<Id,SH_Region_c> shRegionMap = new Map<Id,SH_Region___c>();
      if(Schema.sobjectType.SH_Regin__c.isAccessible()){
      shRegionMap = new Map<Id, SH_Region__c>([
      select id,name, (select id,name from SH_Sub_Regions__r) from SH_Regin__c where id in :regionIdSet WITH SYSTEM_MODE ]);
     }
    }
 
//violation should be thrown if SYSTEM_MODE is set as false and violation should not be thrown if SYSTEM_MODE is set as true
    public void foo(){
      Map<Id,SH_Region_c> shRegionMap = new Map<Id,SH_Region___c>();
      shRegionMap = new Map<Id, SH_Region__c>([
      select id,name, (select id,name from SH_Sub_Rions__r) from SH_Reon__c where id in :regionIdSet WITH SYSTEM_MODE ]);
     }
 
//violation should be thrown as we didnt declared and we didnt used system/user/security
    public void foo(){
      Map<Id,SH_Region_c> shRegionMap = new Map<Id,SH_Region___c>();
      shRegionMap = new Map<Id, SH_Region__c>([
      select id,name, (select id,name from SH_Sb_Regions__r) from S_Region__c where id in :regionIdSet WITH  ]);
     }
 
//violation should not be thrown 
    public void foo(){
      Map<Id,SH_Region_c> shRegionMap = new Map<Id,SH_Region___c>();
      shRegionMap = new Map<Id, SH_Region__c>([
      select id,name, (select id,name from SH_Sub_Regs__r) from SH_Ron__c where id in :regionIdSet WITH USER_MODE ]);
     }
 
//violation should not be thrown 
    public void foo(){
      Map<Id,SH_Region_c> shRegionMap = new Map<Id,SH_Region___c>();
      shRegionMap = new Map<Id, SH_Region__c>([
      select id,name, (select id,name from H_Sub_Regions__r) from H_Region__c where id in :regionIdSet WITH SECURITY_ENFORCED ]);
     }
}
