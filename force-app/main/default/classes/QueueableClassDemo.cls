public class QueueableClassDemo implements Queueable{
  
    public void execute(QueueableContext ctx)
    { List<Account> SubListFromStart =[SELECT id FROM Account];
         for(Account accList:SubListFromStart)
        { 
            //logic to process 2000 records
            accList.Name ='Batch Update' + accList.Name ;
        }
        UPDATE SubListFromStart;
    }
}