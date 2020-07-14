public class PdfAttachment {

public static  pagereference sendAttach(Id candidateId) {
Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
 Candidate_Pratishtha__c candidate = [SELECT Id, Email__c, Status__c FROM Candidate_Pratishtha__c WHERE Id =:candidateId];
    if(candidate.Status__c =='Hired')
    {
PageReference pref = page.CandidateDetailPDF;
pref.getParameters().put('id',(String)candidateId);
pref.setRedirect(true);
Blob b = pref.getContent();
attach.setFileName('CandidateDetail.pdf');
attach.setBody(b);
semail.setSubject('Candidate Details');
String[] sendTo = new String[]{'candidate.Email__c'};
semail.setToAddresses(sendTo);
semail.setPlainTextBody('Please find the attached candidate details');
semail.setFileAttachments(new Messaging.EmailFileAttachment[]{attach});
Messaging.sendEmail(new Messaging.SingleEmailMessage[]{semail});
    }
return null;
}
}