public class CandidateRegistrationCustom {
    public Candidate_Pratishtha__c candidate { get; private set; }

    
    public CandidateRegistrationCustom() {
        Id id = ApexPages.currentPage().getParameters().get('id');

        candidate = (id == null) ? new Candidate_Pratishtha__c() :

            [SELECT First_Name__c FROM Candidate_Pratishtha__c WHERE Id = :id];

    }
    
    
    public PageReference save() {
         try {

            upsert(candidate);

        } catch(System.DMLException e) {

            ApexPages.addMessages(e);

            return null;

        }

        //  After successful Save, navigate to the default view page

        PageReference redirectSuccess = new ApexPages.StandardController(candidate).view();

        return (redirectSuccess);

    } 
}