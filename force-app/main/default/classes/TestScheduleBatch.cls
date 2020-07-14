public class TestScheduleBatch implements Database.Batchable<SObject>{
     public Database.QueryLocator Start(Database.BatchableContext ctx)
         {  
             // 1 million records -----2000 records will process first i.e given to execute method
             return database.getQueryLocator([SELECT id FROM Account]);
         }
    
    
    public void Execute(Database.BatchableContext bctx, List<Account> SubListFromStart)
    {
        for(Account accList:SubListFromStart)
        { 
            //logic to process 2000 records
            accList.Name ='Batch Update' + accList.Name ;
        }
        UPDATE SubListFromStart;
    }
    
    
    public void  Finish(Database.BatchableContext bchctx)
    {
        System.debug('Batch Job Completed');
    }
}