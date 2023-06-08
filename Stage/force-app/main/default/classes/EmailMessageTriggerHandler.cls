public with sharing class EmailMessageTriggerHandler {
    public static void changeStatus(List<EmailMessage> newEmail) {
        List<Case> cases = new List<Case>();

        Group oc = [SELECT Id FROM Group WHERE Type = 'Queue' AND DeveloperName = 'Other_Channels'];
        Group prev= [SELECT Id FROM Group WHERE Type = 'Queue' AND DeveloperName = 'Previc'];
        Group gerat= [SELECT Id FROM Group WHERE Type = 'Queue' AND DeveloperName = 'Gerat'];
        Group web= [SELECT Id FROM Group WHERE Type = 'Queue' AND DeveloperName = 'WEB'];

        Case c = [Select Id, caseNumber, OwnerId, ContactId, Description, Status FROM Case WHERE Id = :newEmail[0].ParentId];
        Set<Id> caseId = new Set<Id>();

        if (c.OwnerId != oc.Id && c.OwnerId != prev.Id && c.OwnerId != gerat.Id && c.OwnerId != web.Id && c.Status != 'Fechado'){  
            for (Integer i=0 ; i < newEmail.size() ; i++){ 
                      
                if(!newEmail[0].Subject.contains('Re: Sandbox:') || (newEmail[0].Subject.contains('Re: Sandbox:') && newEmail[0].Status == '3')){
                    c.Status = 'Aguardando Cliente';
                }else if(newEmail[0].Status == '0'){
                    c.Status = 'Em Andamento';
                }
                
                if(!cases.isEmpty()){
                     
                }               
            }
            cases.add(c); 
            update cases;           
        }else if(c.Status == 'Fechado' && newEmail[0].Status != '3' ){
           try{
            if(!caseId.contains(c.Id)){
                List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
                EmailTemplate emailTemp = [Select Id, Subject, Body From EmailTemplate Where DeveloperName = 'CaseClosed'];
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setTemplateId(emailTemp.Id);
                mail.setTargetObjectId(c.ContactId);
                mail.setWhatId(c.Id);
                emailList.add(mail);
                if(!emailList.isEmpty()){
                    Messaging.sendEmail(emailList);
                    caseId.add(c.Id);
                }                
            }           
            
        }catch(Exception e){
            System.debug('e >>>>>' + e);
            c.Description = e.getMessage();
            System.debug('desc' + c);
        }
    }
    }    
    

        /*
    public static void sendEmailTemplateWithTemplate() {
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        EmailTemplate emailTemp = [Select Id, Subject, Body From EmailTemplate Where DeveloperName = 'CaseClosed'];
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTemplateId(emailTemp.Id);
        mail.setTargetObjectId('0037500000HHbsvAAD');
		mail.setWhatId('50075000002JmG2AAK');
        emailList.add(mail);
        
        if(!emailList.isEmpty()){
            Messaging.sendEmail(emailList);
        }
    }*/
}