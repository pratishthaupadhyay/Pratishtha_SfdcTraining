global class SchedularForExpiredJobs implements Schedulable {

     global void execute(SchedulableContext ctx) {
       
      List< Job_Pratishtha__c > jobs = [ SELECT Id, Active__c, Expires_On__c FROM Job_Pratishtha__c WHERE Expires_On__c  < = Today];
         for(Job_Pratishtha__c job : jobs) {
        
             job.Active__c = False;
                 
             }
         if( jobs.size() > 0 ) {
             update jobs;
         }

   }
// System.schedule('jobName',' 0 0 0 * * ? *', new SchedularForExpiredJobs());
}