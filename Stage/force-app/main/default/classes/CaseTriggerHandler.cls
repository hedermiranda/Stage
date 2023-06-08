public class CaseTriggerHandler {
    public static void ChangeQueue(List<Case> listTriggerNew, Map<Id,Case> oldCaseMap) {
        List<Case> listUpdate = new List<Case>();
        Map<String,Group> mapQueue = new Map<String,Group>();
        for(Group g : [SELECT Id, Name FROM Group WHERE Type = 'Queue']){
            mapQueue.put(g.Name,g);
        }
        for (Case cas : listTriggerNew) {            
            cas.OwnerId = mapQueue.get(cas.Occupation_area__c)?.Id;
            listUpdate.add(cas);
        }
    }

    public static void updateCase(List<Case> newCase) {
        try{
            List<Case> lstCaseUpdate = new List<Case>();
            for(Case cas : newCase){
                if(cas.AccountId != null && cas.ContactId != null){ //Criando case a partir do Contato
                    System.debug('Primeiro iff');
                    Account acc = [SELECT Id, Registration__c FROM Account WHERE Id =: cas.AccountId];
                    System.debug('TRIGGER >> acc.Registration__c >>' + acc.Registration__c + ' >> cas.Id >> ' + cas.Id);
                    CaseTriggerHelper.updateRegistration(acc.Registration__c, cas.Id, 'update');
                }else if(cas.Registration__c != null){
                    System.debug('Terceiro iff');
                    System.debug('TRIGGER >> cas.Registration__c >>' + cas.Registration__c + ' >> cas.Id >> ' + cas.Id + ' >> Trigger.new >> ' + Trigger.new);
                    CaseTriggerHelper.updateRegistration(cas.Registration__c, cas.Id, 'insert');
                }
            }
            update lstCaseUpdate;
        }catch(Exception e){
            System.debug(e);
        }
    }
    public static void getContact(String accId, List<Case> newCase) {
        try{
            Account acc = [SELECT Id FROM Account WHERE Id =: accId];
            Contact con = [SELECT Id FROM Contact WHERE AccountId =: accId];
            List<Case> lstCaseUpdate = new List<Case>();
            for(Case cas : newCase){
                cas.ContactId = con.Id;
                lstCaseUpdate.add(cas);
            }
            update lstCaseUpdate;
        }catch(Exception e){
            System.debug(e);
        }
    }
}