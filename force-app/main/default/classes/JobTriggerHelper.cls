public class JobTriggerHelper {
         
    public static void isActive()
    {
        List <Job_Pratishtha__c> jobList = new List<Job_Pratishtha__c> ();
    
        for(Job_Pratishtha__c job :[SELECT Number_of_Positons__c, Hired_Applicants__c, Active__c FROM Job_Pratishtha__c]){
        //// checking if the job is inactive with vacancy
        if(job.Number_of_Positons__c > job.Hired_Applicants__c  && job.Active__c !=true)
        {
            
            job.Active__c = true;
             jobList.add(job);  
         
         }
        }
        
     if (jobList.size()>0)
         update jobList;
    }
        
    // checking if the job is active without any vacant position
        public static void isInActive()
    {
        List <Job_Pratishtha__c> jobList = new List<Job_Pratishtha__c> ();
    
        for(Job_Pratishtha__c job :[SELECT Number_of_Positons__c, Hired_Applicants__c, Active__c FROM Job_Pratishtha__c]){

        if(job.Number_of_Positons__c == job.Hired_Applicants__c && job.Active__c ==true)
        {
            
            job.Active__c = false;
             jobList.add(job);  
         
         }
        
        }    
     
     if (jobList.size()>0)
         update jobList;


    }
    
    public static void deletingActiveJob(List<Job_Pratishtha__c> job)
    {
          for(Job_Pratishtha__c j :job)
     {
       if(j.Active__c == true)
        {
          j.AddError(
            'This job is active and cannot be deleted.'); 
       }
   }
    }
    public static void emailToManager() {
    
         for(Job_Pratishtha__c j :[SELECT Number_of_Positons__c, Hired_Applicants__c, 
                              Active__c,LastModifiedDate,ContactId__r.Email FROM Job_Pratishtha__c WHERE Active__c =true]){
        
        if(j.Number_of_Positons__c == j.Hired_Applicants__c ){
              
            String em= (String)j.ContactId__r.Email;
            EmailManager.sendMail(em,'No job opportunity'
                                   ,'All required candidate has been hired for this job on'+ j.LastModifiedDate);
         
         }
        
    }
    }
   
        /* public static void beforeInsertT1B() {
   
        
        
        Map<id,Job_Pratishtha__c> mapForjob =new  Map<id,Job_Pratishtha__c>([SELECT id from Job_Pratishtha__c WHERE Active__c = false]);
        
        for(Candidate_Pratishtha__c canObject :(list<Candidate_Pratishtha__c>) Trigger.New)
        {
            if(mapForjob.containsKey(canObj.Job__c))
            {
                canObject.addError('This job is not active');
            }
   
    }
          */
    
    public static boolean inActive1(List<Job_Pratishtha__c> j)
    {
        Boolean result=true;
        for(Job_Pratishtha__c jobs:j)
        {
            if(jobs.Active__c==false)
            {
                result=false;
            }
		}
        return result;
    }
       
    
}