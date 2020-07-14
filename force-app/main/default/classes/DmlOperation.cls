public class DmlOperation {
     public void test()
     {
    Account acc =new Account();
    acc.name ='moni';
    insert acc;
    System.debug(acc);
     }
}