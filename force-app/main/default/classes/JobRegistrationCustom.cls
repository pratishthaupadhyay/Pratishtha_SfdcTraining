public class JobRegistrationCustom {
 public Job_Pratishtha__c job { get; private set; }

    
    public JobRegistrationCustom() {
        Id id = ApexPages.currentPage().getParameters().get('id');

        job = (id == null) ? new Job_Pratishtha__c() :

            [SELECT Name__c, Description__c FROM Job_Pratishtha__c WHERE Id = :id];

    }
    
    
    public PageReference save() {
         try {

            upsert(job);

        } catch(System.DMLException e) {

            ApexPages.addMessages(e);

            return null;

        }

        //  After successful Save, navigate to the default view page

        PageReference redirectSuccess = new ApexPages.StandardController(job).view();

        return (redirectSuccess);

    } 
}