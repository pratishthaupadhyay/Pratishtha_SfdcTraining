trigger JobTrigger on Job_Pratishtha__c (before delete ,before insert, after update) {
       if(!TriggerSetting__c.getInstance().TriggerSet__c    )
       {
    if(trigger.isDelete)
        {
           JobTriggerHelper.deletingActiveJob(Trigger.old);
              System.debug('***SFDC: Trigger.old is: ' + Trigger.old);
              System.debug('***SFDC: Trigger.new is: ' + Trigger.new);
         }
    
    if(trigger.isUpdate && trigger.isAfter) 
    {
    
        JobTriggerHelper.isActive();
          System.debug('***SFDC: Trigger.old is: ' + Trigger.old);
          System.debug('***SFDC: Trigger.new is: ' + Trigger.new);
    
    }
    
    if((trigger.isInsert || trigger.isUpdate) && trigger.isAfter )
    {
        JobTriggerHelper.emailToManager();
          System.debug('***SFDC: Trigger.old is: ' + Trigger.old);
        System.debug('***SFDC: Trigger.new is: ' + Trigger.new);
        
    }
   
           
       }
}