trigger CandidateTrigger on Candidate_Pratishtha__c ( before insert, after insert, after update ) {
           
      
         CandidateTriggerHelper.expectedSalaryError( Trigger.new[0]);
         CandidateTriggerHelper.deactivatedjob( Trigger.new );
    if( Trigger.isAfter && ( Trigger.isInsert || trigger.isUpdate )) {
  
         
       CandidateTriggerHelper.isHired( Trigger.newMap );
    }
    
    if ( Trigger.isAfter && Trigger.isInsert ) {
        CandidateTriggerHelper.applicationDate();
    }
    
}