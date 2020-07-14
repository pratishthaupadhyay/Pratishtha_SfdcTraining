public class ScheduleApexDemo implements Schedulable{
     public void execute(SchedulableContext sctx)
     {
         
Database.executeBatch(new TestScheduleBatch());
}
}