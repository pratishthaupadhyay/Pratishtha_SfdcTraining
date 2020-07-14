public class TestClass {
        Job_Pratishtha__c jb= [SELECT Id,Name FROM Job_Pratishtha__c];    
    Candidate_Pratishtha__c can = [SELECT Job__c FROM Candidate_Pratishtha__c WHERE Job__c=:jb.Id];
   
}