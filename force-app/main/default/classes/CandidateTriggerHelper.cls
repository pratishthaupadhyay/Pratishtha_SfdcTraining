public class CandidateTriggerHelper {
        
    public static void expectedSalaryError(Candidate_Pratishtha__c c)
         {
              
    if(c.Expected_Salary__c==NULL)
       {
          c.AddError(
            'Expected Salary field is missing.'); 
       }
         }
   
    public static void isHired(Map<Id, Candidate_Pratishtha__c> candidatesId)
        
    {       List<Candidate_Pratishtha__c> candidates =[SELECT Id , Status__c FROM Candidate_Pratishtha__c WHERE Id =:candidatesId.keySet()];
            List<Id> candidateList=new List<Id>();
              for(Candidate_Pratishtha__c can:candidates )
              {
                  if(can.Status__c =='Hired')
                  {
                       candidateList.add(can.Id);
                  }
                  
              }
                  SendEmail.SendToCandidate(candidateList);
    }
    
    
    public static void toPage(List<Id> candidatesId)
        
    {       List<Candidate_Pratishtha__c> candidates =[SELECT Id , Status__c FROM Candidate_Pratishtha__c WHERE Id =:candidatesId ];
            List<Id> candidateList=new List<Id>();
              for(Candidate_Pratishtha__c can:candidates )
              {
                  if(can.Status__c =='Hired')
                  {
                       candidateList.add(can.Id);
                  }
                  
              }
                  SendEmail.SendToCandidate(candidateList);
    }
    
    public static void deactivatedjob(List<Candidate_Pratishtha__c> can)
    {
         for(Candidate_Pratishtha__c c: can)
         { 
             String jobName =c.Job__c;
          for(Job_Pratishtha__c job:[SELECT id FROM Job_Pratishtha__c WHERE Active__c!=true])
          {
              if(job.id == jobName)
             {
          c.AddError(
            'This job is not active.');
               }
          }
         }
    }
    
   
    public static void applicationDate () {
        
        List<Candidate_Pratishtha__c> updatedList = 
        [ SELECT Id, CreatedDate, Application_Date__c FROM Candidate_Pratishtha__c WHERE CreatedDate =: System.Today() + 1 ] ;
       System.debug(updatedList);
    for(Candidate_Pratishtha__c c :updatedList) {
          c.Application_Date__c = System.Today() + 1 ;
           updatedList.add(c);  
    }
        update updatedList;
    } 
    
    
   /* public Contact getContactMethod1() {

        if(c == null) c = [SELECT Id, Name FROM Contact LIMIT 1];
        return c;


getContactMethod2(): {!contactMethod2.name}<br/>

    getContactMethod1(): {!contactMethod1.name}

    }*/
    
     

    
}