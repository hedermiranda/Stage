@isTest
public class CaseTriggerTest {
    @isTest
    static void changeQueueTest(){
        Profile p = [SELECT Id FROM Profile WHERE name='System Administrator' OR name='Administrador do Sistema']; 
        User us = new User(Alias = 'UserTest', Email='newtestuser@test.com', 
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='nezw123user@test152org.com');
        System.debug(us);
        insert us;
        Case newCase = new Case(OwnerId = us.Id, Registration__c = '600');
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
    @isTest
    static void erroTrue(){                
       CaseTriggerHelper.testAuxiliary = new Map<String,Object>{'statusCode' => 200, 'body' => '{"erro": "CAASK100.CAASP114: [1] Cliente não encontrado."}'};
        executeIntegrations();
        executeDML();
        Case newCase = new Case();
        newCase.Registration__c = '600';
        insert newCase;
    }
    @isTest
    static void mapStatusApose(){
        CaseTriggerHelper.testAuxiliary = new Map<String,Object>{'erro' => null,'statusCode' => 200, 'body' => '{    "cadastro": {        "nome": "MARIA NOGUEIRA DIOGENES",        "cpf": 29768268387,        "dataNascimento": "05/03/1950",        "sexo": "F",        "tipoCliente": "F",        "matricula": 6863417,        "codPlano": 1,        "codSituacaoEmpresa": 600,        "situacaoEmpresa": "DESLIGAMENTO PARA APOSENTADORIA",        "situacaoPrevi": "APOSE",        "statusPrevi": "NOR",        "codEmpresa": 2,        "nomeEmpresa": "BANCO DO BRASIL S.A.",        "numSeqPrevi": 1,        "email": "mariandiogenes@farmaciasdapraca.com.br",        "estadoCivil": "DIVORCIADO",        "idEstadoCivil": 4,        "tipo": "20 - Carteira de Identidade",        "codigoNumero": "131972",        "emissao": "03/07/1972",        "orgaoEmissor": "SJSP PI",        "pisPasep": "010075661214",        "pai": "ADEMAR QUEIROZ DIOGENES",        "mae": "MARIA DO CARMO PEQUENO DIOGENES",        "nacionalidade": "01 - Brasileiro(a)",        "naturalidade": "JAGUARIBE CE",        "capacCivil": 1,        "descCapacCivil": "CAPAZ"    }}'};
        executeIntegrations();
        executeDML();
    }    
    @isTest
    static void mapStatusAtivo(){                
       CaseTriggerHelper.testAuxiliary = new Map<String,Object>{'erro' => null,'statusCode' => 200, 'body' => '{"cadastro":{"nome":"ALFREDO ANTONIO", "codPlano": 1, "situacaoPrevi": "ATIVO", "statusPrevi": "EXT", "codSituacaoEmpresa": 800}}'};
        executeIntegrations();
        CaseTriggerHelper.testAuxiliary4 = new Map<String,Object>{'statusCode' => 200, 'body' => '{"opcoesCorrespondencia":[]}'};
        executeDML();
    }
    @isTest
    static void mapStatusCredor(){                
       CaseTriggerHelper.testAuxiliary = new Map<String,Object>{'erro' => null,'statusCode' => 200, 'body' => '{"cadastro":{"nome":"ALFREDO ANTONIO", "codPlano": 1, "situacaoPrevi": "CREDOR", "statusPrevi": "NOR", "codSituacaoEmpresa": 800}}'};
        executeIntegrations();
        executeDML();
    }
    @isTest
    static void mapStatusEncerrado(){                
       CaseTriggerHelper.testAuxiliary = new Map<String,Object>{'erro' => null,'statusCode' => 200, 'body' => '{"cadastro":{"nome":"ALFREDO ANTONIO", "codPlano": 1, "situacaoPrevi": "Encer", "statusPrevi": "VES", "codSituacaoEmpresa": 800}}'};
        executeIntegrations();
        executeDML();
    }
     @isTest
    static void mapStatusPensao(){                
       CaseTriggerHelper.testAuxiliary = new Map<String,Object>{'erro' => null,'statusCode' => 200, 'body' => '{"cadastro":{"nome":"ALFREDO ANTONIO", "codPlano": 1, "situacaoPrevi": "Pensao", "statusPrevi": "BPD", "codSituacaoEmpresa": 800}}'};
        executeIntegrations();
        executeDML();
    }
    @isTest
    static void mapStatusApose2(){
        CaseTriggerHelper.testAuxiliary = new Map<String,Object>{'erro' => null,'statusCode' => 200, 'body' => '{"cadastro":{"nome":"ALFREDO ANTONIO", "codPlano": 2, "situacaoPrevi": "APOSE", "statusPrevi": "EXT", "codSituacaoEmpresa": 800}}'};    
            executeIntegrations();
        executeDML();
    }    
    @isTest
    static void mapStatusAtivo2(){                
       CaseTriggerHelper.testAuxiliary = new Map<String,Object>{'erro' => null,'statusCode' => 200, 'body' => '{"cadastro":{"nome":"ALFREDO ANTONIO", "codPlano": 2, "situacaoPrevi": "ATIVO", "statusPrevi": "EXT", "codSituacaoEmpresa": 800}}'};
        executeIntegrations();
        executeDML();
    }
    @isTest
    static void mapStatusCredor2(){                
       CaseTriggerHelper.testAuxiliary = new Map<String,Object>{'erro' => null,'statusCode' => 200, 'body' => '{"cadastro":{"nome":"ALFREDO ANTONIO", "codPlano": 2, "situacaoPrevi": "CREDOR", "statusPrevi": "NOR", "codSituacaoEmpresa": 800}}'};
        executeIntegrations();
        executeDML();
        Case newCase = new Case();
        newCase.Registration__c = '600';
        insert newCase;
    }
    @isTest
    static void mapStatusEncerrado2(){                
       CaseTriggerHelper.testAuxiliary = new Map<String,Object>{'erro' => null,'statusCode' => 200, 'body' => '{"cadastro":{"nome":"ALFREDO ANTONIO", "codPlano": 2, "situacaoPrevi": "Encer", "statusPrevi": "VES", "codSituacaoEmpresa": 800}}'};
        executeIntegrations();
        executeDML();
    }
     @isTest
    static void mapStatusPensao2(){                
       CaseTriggerHelper.testAuxiliary = new Map<String,Object>{'erro' => null,'statusCode' => 200, 'body' => '{"cadastro":{"nome":"ALFREDO ANTONIO", "codPlano": 2, "situacaoPrevi": "Pensao", "statusPrevi": "BPD", "codSituacaoEmpresa": 800}}'};
        executeIntegrations();
        executeDML();
    }
    @isTest
    static void mapStatusPesind(){                
       CaseTriggerHelper.testAuxiliary = new Map<String,Object>{'erro' => null,'statusCode' => 200, 'body' => '{"cadastro":{"nome":"ALFREDO ANTONIO", "codPlano": 2, "situacaoPrevi": "PESIND", "statusPrevi": "NOR", "codSituacaoEmpresa": 800}}'};
        executeIntegrations();
        executeDML();
    }
    static void executeIntegrations(){
        CaseTriggerHelper.testAuxiliary2 = new Map<String,Object>{'statusCode' => 200, 'body' =>'{"email":"Test123"}'};    
        CaseTriggerHelper.testAuxiliary3 = new Map<String,Object>{'statusCode' => 200, 'body' =>'{"enderecos":[{"idMunicipio": 7158}]}'};
        CaseTriggerHelper.testAuxiliary4 = new Map<String,Object>{'statusCode' => 200, 'body' => '{"opcoesCorrespondencia":[{"idCorrespondencia": 2E+1,"correspondencia": "Demonstrativos para IR","envioPostal": "N","envioEmail": "D","envioCelular": "D"},{"idCorrespondencia": 3E+0,"correspondencia": "InfPREVI","envioPostal": "D",   "envioEmail": "S",  "envioCelular": "D" }, {"idCorrespondencia": 9E+0, "correspondencia": "Outras informações institucionais","envioPostal": "N","envioEmail": "S","envioCelular": "N"}, {"idCorrespondencia": 1.1E+1,"correspondencia": "Clube de Benefícios do Cartão PREVI","envioPostal": "S","envioEmail": "S","envioCelular": "S"},{"idCorrespondencia": 1.9E+1,"correspondencia": "Outras informações promocionais","envioPostal": "N","envioEmail": "S","envioCelular": "N" } ]}'};
        CaseTriggerHelper.testAuxiliary5 = new Map<String,Object>{'statusCode' => 200, 'body' => '{"municipiosBR": [{"idMunicipio": 7158,"municipio": "Calgary","uf": "AB"},{"idMunicipio": 22,"municipio": "ACRELANDIA","uf": "AC"}]}' };
        CaseTriggerHelper.testAuxiliary6 = new Map<String,Object>{'statusCode' => 200, 'body' => '[]'};
        CaseTriggerHelper.testAuxiliary7 = new Map<String,Object>{'statusCode' => 200, 'body' => '{"telefones": [{"ddi": null,"ddd": "55","telefone": "35371745","ramal": null,"tipo": "fixo"},{"ddi": null,"ddd": null,"telefone": null,"ramal": null,"tipo": "celular"},{"ddi": null,"ddd": null,"telefone": null,"ramal": null,"tipo": "fax"},{"ddi": null,"ddd": null,"telefone": null,"ramal": null,"tipo": "fixo"}]}'};
    }
    
    static void executeDML(){
        Profile p = [SELECT Id FROM Profile WHERE name='System Administrator' OR name='Administrador do Sistema']; 
        User us = new User(Alias = 'UserTest', Email='newtestuser@test.com', 
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                           LocaleSidKey='en_US', ProfileId = p.Id, 
                           TimeZoneSidKey='America/Los_Angeles', UserName='nezw123user@test152org.com');
        insert us;
        Account acc = new Account(Name='Suporte SLA',Registration__c='700');
        insert acc;
        
        Contact con = new Contact(LastName = 'Janu', AccountId = acc.Id);
        insert con;
        Case newCase = new Case();
        newCase.Registration__c = '700';
        newCase.AccountId = acc.Id;
        newCase.OwnerId = us.Id;
        insert newCase;
    }
}