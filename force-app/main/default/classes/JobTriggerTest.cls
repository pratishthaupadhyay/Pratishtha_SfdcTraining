@isTest
public class JobTriggerTest {
     
    
   

    @testSetup public static void setUp() {
        

        Contact contact = new Contact(LastName='Upadhyay');
        insert contact;
        Job_Pratishtha__c job = new Job_Pratishtha__c();
        job.Number_of_Positons__c = 0;
        job.Job_Type__c = 'Admin';
        job.Certification_Required__c= 'CISCO';
        job.Qualification_Required__c='Bcom';
        job.Required_Skills__c='Linux';
        job.ContactId__c=contact.Id;
        job.Active__c =true;    
        
        insert job;

    } 
    
    @isTest static void updateJobTrigger ()
    {  
         Test.startTest();
     Job_Pratishtha__c jobs=JobTestHelper.getJob();
          insert jobs;
        Job_Pratishtha__c job = JobTestHelper.getJob();
        
            if( job.Number_of_Positons__c > job.Hired_Applicants__c ) {
            
              job.Active__c = true;
            }
           Test.stopTest();
           JobTriggerHelper.isActive();
           System.assertEquals(true, job.Active__c);
         
    }
    
    @isTest static void updateJobToInactive ()
    {
        Test.startTest();
        //insert JobTestHelper.getJob();
        Job_Pratishtha__c j1=new Job_Pratishtha__c();
        
        List<Job_Pratishtha__c> job =[SELECT ID,Active__c,Number_of_Positons__c,Hired_Applicants__c FROM Job_Pratishtha__c where Job_Type__c='Admin' Limit 1];
        system.debug([SELECT ID,Hired_Applicants__c,Number_of_Positons__c FROM Job_Pratishtha__c where Job_Type__c='Admin' Limit 1]);
       for(Job_Pratishtha__c j:job)
       {
            if(j.Number_of_Positons__c == j.Hired_Applicants__c )
                 {
                    j.Active__c = false;
                }
           j1.Active__c=j.Active__c;
              
       }
        update job;
           Test.stopTest();
       Boolean result=JobTriggerHelper.inActive1(job);
       //JobTriggerHelper.isInActive() ;
         System.assertEquals(false, result);
        // System.assertEquals(false,j1.Active__c);
         
    }
   
 @istest
  static void activeJobDeletionTrigger()
  {    
      Test.startTest();
        // insert JobTestHelper.getJob();
        Job_Pratishtha__c job = [SELECT ID,Active__c FROM Job_Pratishtha__c WHERE Job_Type__c='Admin' ];
      String s='This job is active and cannot be deleted.';
      
       //job.AddError('This job is active and can not be deleted');
       database.DeleteResult result=database.delete(job,false);
 
      Test.stopTest();
      
      //System.assert(job.Id != Null);
      system.assertEquals(s,  result.getErrors()[0].getMessage());
      
  }
   
}