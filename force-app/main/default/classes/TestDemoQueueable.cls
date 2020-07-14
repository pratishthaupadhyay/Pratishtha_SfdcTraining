public class TestDemoQueueable implements Queueable {
      public void execute(QueueableContext context)
      {
          Delete [SELECT id FROM Case WHERE createddate=LAST_YEAR];
      }
                 
}