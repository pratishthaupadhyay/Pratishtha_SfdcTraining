public class UpdateContactAddress {
    @InvocableMethod public static void updateContact( ){
        List<Contact> contactUpdated=new List<Contact>();
        List<Contact> contactList=new List<Contact>();
        contactList= [SELECT Id, MailingAddress, AccountId, Email FROM Contact WHERE LastName LIKE '%test%']; 
       for(Contact contact:contactList)
        {  Account account =[SELECT ShippingStreet,ShippingCity, ShippingState, ShippingCountry, ShippingPostalCode FROM Account WHERE Id =:contact.AccountId];
            contact.MailingStreet = account.ShippingStreet;   
            contact.MailingCity = account.ShippingCity;
            contact.MailingState =account.ShippingState;
            contact.MailingCountry =account.ShippingCountry;
            contact.MailingPostalCode =account.ShippingPostalCode;
            contactUpdated.add(contact);
         
        }
        update contactUpdated;
        
    }  
    
}