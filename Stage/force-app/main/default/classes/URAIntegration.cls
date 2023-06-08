@RestResource(urlMapping='/caseura/*')
global class URAIntegration {
    global class RequestWS {
        String cpf {get;set;}
        String matricula {get;set;}
        String autenticacao {get;set;}
        String canal {get;set;}
    }

    global class ResponseWS {
        String caseId {get;set;}
    }
    
    @httpGet
    global static ResponseWS getCase(){
        restRequest request= RestContext.Request;

        RequestWS caseUra = new RequestWS();
        caseUra.cpf = request.params.get('cpf');
        caseUra.matricula = request.params.get('matricula');
        caseUra.autenticacao = request.params.get('autentic');
        caseUra.canal = request.params.get('canal');

        System.debug('CPF >> ' + caseUra.cpf + ' MATRICULA >> '+ caseUra.matricula + ' AUTENTICACAO >> ' + caseUra.autenticacao + 'CANAL >> ' + caseUra.canal);
        
        Case cas = new Case();
        if(caseUra.matricula != null && caseUra.matricula.length() != 11){
            List<Account> lstAcc =[Select Id, Name from account where Registration__c =: caseUra.matricula];
            System.debug('lstAcc >> ' + lstAcc);
            cas.AccountId = lstAcc.size() > 0 ? lstAcc[0].Id: null;
        }else if(caseUra.cpf != null){
           List<Account> lstCont =[select Id, Name from Account where CPF__pc  =: caseUra.cpf];
           cas.AccountId = lstCont.size() > 0 ? lstCont[0].Id: null;
        }
        if(caseUra.canal != null){
            String recordType;
            switch on caseUra.canal.toUpperCase() {
                when 'ATENDIMENTO' {
                    recordType = 'Atendimento';
                }
                when 'OUVIDORIA'{
                    recordType = 'Participant';
                }
            }
            RecordType recordId = [Select id from RecordType where DeveloperName =: recordType];
            cas.RecordTypeId = recordId.id;
        }

        insert cas; 
        
        ResponseWS response = new ResponseWS();
        response.caseId = cas.Id;
        return response;
    }
}