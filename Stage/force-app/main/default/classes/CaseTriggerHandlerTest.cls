@isTest
public class CaseTriggerHandlerTest {
    @isTest
    static void changeQueueTest(){
        Profile p = [SELECT Id FROM Profile WHERE name='System Administrator']; 
        User us = new User(Alias = 'UserTest', Email='newtestuser@test.com', 
                          EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='nezw123user@test152org.com');
        System.debug(us);
        insert us;
        Case newCase = new Case(OwnerId = us.Id);
        insert newCase;
        
        Case newSub = new Case();
        newSub.ParentId = newCase.Id;
      	newSub.OwnerId = us.Id;
        newSub.Type = 'Complaint';
        newSub.Producty__c = 'Canais de Relacionamento';
        newSub.Service__c ='Acesso/Navegação';
        newSub.Sub_Service__c='Aplicativo - A/N';
        newSub.Occupation_area__c = 'Ouvir';
        insert newSub;
        
        Test.startTest();
        newSub.Occupation_area__c = 'Gerat';
        update newSub;		
        Test.stopTest();        
        
    }
}