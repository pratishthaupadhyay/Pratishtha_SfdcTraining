public class QueueableScheduleClass implements Schedulable{
        
    public void execute(SchedulableContext ctx)
    {
        System.enqueueJob(new QueueableClassDemo());
    }
}