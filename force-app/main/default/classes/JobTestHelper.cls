public class JobTestHelper {
     
    public static Job_Pratishtha__c getJob()
    {
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
        return job;
    }
}