public class JobDetailCustom {
    
     public sObject jobRecord{get; set;}
    public List<String> jobFields {get; set;}

    public List<sObject> records{get;set;}
    public List<String> fields{get;set;}
    public JobDetailCustom() {
       

   jobRecord= [Select Id, Name, Number_of_Positons__c,Job_Type__c,ContactId__r.Email FROM Job_Pratishtha__c  WHERE Id =: Apexpages.currentpage().getparameters().get('id')];
       jobFields = new List<String>{'Name', 'Number_of_Positons__c','Job_Type__c', 'ContactId__r.Email'};
    
               records= [Select First_Name__c, Last_Name__c, Email__c,Country__c, State__c, Job__c, Status__c  FROM Candidate_Pratishtha__c WHERE Job__c = :jobRecord.Id];
        fields = new List<String>{'First_Name__c', 'Last_Name__c', 'Email__c','Country__c', 'State__c', 'Job__c', 'Status__c'};

  
}
}