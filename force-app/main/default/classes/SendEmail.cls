public class SendEmail {
      @Future(callout=true)   
    public static void SendToCandidate(List<ID> candidateId)
    {
       Candidate_Pratishtha__c  HiredCandidates = [SELECT Id,Full_Name__c,Email__c FROM Candidate_Pratishtha__c WHERE Id =:candidateId];
              
         PageReference ref = Page.CandidateDetailPDF;
          Blob b = ref.getContent();
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        Messaging.EmailFileAttachment efa1 = new Messaging.EmailFileAttachment();
         efa1.setFileName('CandidateDetailPDF.pdf');
         efa1.setBody(b);
        String addresses;
        mail.setSubject( 'Congratulations!!! You are Hired.' +String.valueOf(DateTime.now()));
        String[] toAddresses = new String[] {HiredCandidates.Email__c};
        String subject = 'Congratulations!!! You are Hired.'+String.valueOf(DateTime.now());
        String  body='Hello '+HiredCandidates.Full_Name__c+ ',\n\t\t You are Hired for the applied position';
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
     
        mail.setFileAttachments(new Messaging.EmailFileAttachment[] {efa1});
        // Pass this email message to the built-in sendEmail method
        // of the Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                 new Messaging.SingleEmailMessage[] { mail });
       
        // Call a helper method to inspect the returned results
        inspectResults(results);
    }
   
    // Helper method
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
       
        // sendEmail returns an array of result objects.
        // Iterate through the list to inspect results.
        // In this class, the methods send only one email,
        // so we should have only one result.
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            }
            else {
                sendResult = false;
                System.debug('The following errors occurred: ' + res.getErrors());                
            }
        }
       
        return sendResult;
    }
     
           // Messaging.EmailFileAttachment efa1 = new Messaging.EmailFileAttachment();
           // efa1.setFileName('attachment_WORK.pdf');
            //efa1.setBody(b);
           //PageReference.getContent();
        
       // String em = (String) candidate.Email__c; 
        //EmailManager.sendMail(em,' Job Confirmation'
           //                        ,'You have been hired for this job.');

    }