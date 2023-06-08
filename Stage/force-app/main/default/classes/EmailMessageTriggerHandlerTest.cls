@isTest
public class EmailMessageTriggerHandlerTest {
    
	@isTest    
    static void changeStatusTest(){
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User us = new User(Alias = 'UserTest', Email='newtestuser@test.com', 
                          EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='nezw123user@test152org.com');
        System.debug(us);
        insert us;
        
        Case newCase = new Case(OwnerId = us.Id);
        Insert newCase;
        
        EmailMessage newEmail = new EmailMessage(Subject = 'SubjectTest', ParentId=newCase.Id, Status = '3');
        
        
        Test.startTest();
        insert newEmail;		
        Test.stopTest();
    }
    
    @isTest
	static void statusCaseClosed(){  
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User us = new User(Alias = 'UserTest', Email='newtestuser@test.com', 
                          EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='nezw123user@test152org.com');
        System.debug(us);
        insert us;
        
        Case newCase = new Case(OwnerId = us.Id, Status = 'Fechado');   
        Insert newCase;
        EmailMessage newEmail = new EmailMessage(Subject = 'SubjectTest', ParentId=newCase.Id, Status = '1');
        
        Test.startTest();        
        insert newEmail;
        Test.stopTest();
        
    }
}