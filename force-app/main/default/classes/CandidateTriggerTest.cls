@isTest
public class CandidateTriggerTest {
   @isTest public static void expectedSalaryCheck()
   {
       Candidate_Pratishtha__c candidate = new Candidate_Pratishtha__c();
       candidate.First_Name__c ='Nishtha';
       candidate.Last_Name__c ='Upadhyay';
       candidate.Email__c ='nishthaupadhyay@gmail.com';
       candidate.Status__c ='Applied';
       candidate.Country__c = 'India';
       candidate.State__c = 'Madhyapradesh';
       candidate.Job__c= 'a032x00000554oY';
       Test.startTest();
       // candidate.Expected_Salary__c= 12000;
      if(candidate.Expected_Salary__c == null)
      //candidate.AddError('Expected Salary field is missing');
      insert candidate;
    Test.stopTest();
    Candidate_Pratishtha__c lst =[SELECT Id, Expected_Salary__c FROM Candidate_Pratishtha__c WHERE Job__c= 'a032x00000554oY'];
  
        System.assertNotEquals(null, lst.Id);
        System.assertequals(12000, lst.Expected_Salary__c);

   }
    
    @isTest public static void ApplicationOnDeactivatedJob()
    {
        
    }
}