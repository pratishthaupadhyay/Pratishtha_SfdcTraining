public class ContactCreationQueueable implements Queueable {
      
     private List<Account> accListToCreateContacts ;
     
     public ContactCreationQueueable (List<Account> accountsFromTrigger)
     {
         accListToCreateContacts =accountsFromTrigger;
     }
    public void execute(QueueableContext context)
      {
          //Account(pra) ----to trigger(pass parameter to class with account sobject) ------>Queueableclass contact(pra)
        List<Contact> ListOfContacts = new List<Contact> ();
          for(Account acc: accListToCreateContacts)
          {
              Contact con= new Contact();
              con.LastName=acc.Name;
              con.AccountId=acc.Id;
              ListOfContacts.add(con);
          }
          
          if(ListOfContacts.size() >0)
          {
              Insert ListOfContacts;
          }
      
      }
}