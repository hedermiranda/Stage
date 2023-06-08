public class CaseTriggerHelper {
    @future (callout=true)
    public static void updateRegistration(String matricula, String caseId, String tipoDML) {
        if(tipoDML == 'update'){
            try{
                Account acc = [SELECT Id, Name, Type, Registration__c, Plan_Code__c, Situation__c, Situation_Previ__c, Status_Previ__c, Company_Name__c,
                                Marital_Status__c,Civilian_Capacity__c, Gender__c, District__c, BillingStreet, BillingPostalCode, BillingState, Account_Status__c,
                                Phone, Pessoa_Politicamente_Exposta__c FROM Account WHERE Registration__c =: matricula];
                Contact cont = [SELECT Id, Email, FirstName, LastName, CPF__c, Birthdate, Document_Type__c, Document_Number__c, Issue_Date__c, Dispatching_Agency__c,
                                PisPasep__c, Fathers_Name__c, Mothers_Name__c, Nationality__c, Naturalness__c, DDI_principal__c,DDD_principal__c,
                                Phone2__c, Arm_Principal__c, DDI__c, DDI_Mobile__c, DDD__c, DDD_Mobile__c, Phone, MobilePhone, Arm__c, Fax, MailingState, MailingPostalCode, MailingCountry,
                                MailingCity, MailingStreet FROM Contact WHERE AccountId =: acc.Id];
        
                Map<String,Object> mapObj = callIntegrations(acc, cont, matricula, cont.CPF__c) ;
                if(mapObj.get('erro') == (Boolean) false){
                    System.debug('(Account) mapObj.get(Account)' + (Account) mapObj.get('Account'));
                    System.debug('(Contact) mapObj.get(Contact)' + (Contact) mapObj.get('Contact'));
                    Database.update((Account) mapObj.get('Account'),false);
                    Database.update((Contact) mapObj.get('Contact'),false);
                }
            }catch(Exception e){
                System.debug(e);
            }            
        }else if(tipoDML == 'insert'){
            try{
                Account acc = new Account();
                Contact cont = new Contact();
                Case cas = [SELECT ContactEmail,AccountId,ContactId FROM Case WHERE Id =: caseId];
                Map<String,Object> mapObj = callIntegrations(acc, cont, matricula, cont.CPF__c) ;
                if(mapObj.get('erro') == (Boolean) false){
                    Database.insert((Account) mapObj.get('Account'),false);
                    cont = (Contact) mapObj.get('Contact');
                    cont.AccountId = acc.Id;
                    insert(cont);

                    cas.AccountId = acc.Id;
                    cas.ContactId = cont.Id;
                    Database.update(cas,false);
                }else if(mapObj.get('erro') == (Boolean) true){
                    cas.Public__c = 'Não identificado';
                    System.debug(' Não encontrou o cadastro e o público é: ' + cas.Public__c);
                    Database.update(cas,false);
                }
            }catch(Exception e){
                System.debug(e);
            }            
        }
    }

    public static Map<String,Object> callIntegrations(Account acc, Contact cont, String matricula, String cpf){
        Organization org = [SELECT IsSandbox from Organization];

        Map<String,Object> mapObj = new Map<String,Object>();
        //Integração getCadastro
        System.debug(matricula);
        Map<String,Object> returnCadastro = !Test.isRunningTest() ? IntegrationUtils.getCadastro(matricula) : testAuxiliary;                
        if(returnCadastro.get('statusCode') == 200){
            IntegrationModels.CadastroResponse cad = (IntegrationModels.CadastroResponse) JSON.deserialize((String) returnCadastro.get('body'), IntegrationModels.CadastroResponse.class);
            System.debug('ERRO ? > ' + cad?.erro);
            if(cad?.erro != null){
                mapObj.put('erro',(Boolean) true);
            }else{
                mapObj.put('erro',(Boolean) false);
                try{ 
                    cont.FirstName = cad.cadastro.nome.substring(0,cad.cadastro.nome.indexOf(' '));
                    cont.LastName = cad.cadastro.nome.substring(cad.cadastro.nome.indexOf(' '),cad.cadastro.nome.length()).trim();
                }catch(Exception e){
                    cont.LastName = cad.cadastro.nome;
                }
                acc.Name = cad.cadastro.nome;
                cont.CPF__c = cad.cadastro.cpf;
                cont.Birthdate = cad.cadastro.dataNascimento != null ? Date.parse(cad.cadastro.dataNascimento) : null;
                acc.Gender__c = cad.cadastro.sexo;
                acc.Type = cad.cadastro.tipoCliente;
                acc.Registration__c = cad.cadastro.matricula != null ? String.valueOf(cad.cadastro.matricula) : null;
                acc.Plan_Code__c = cad.cadastro.codPlano;
                acc.Situation__c = cad.cadastro.codSituacaoEmpresa != null ? String.valueOf(cad.cadastro.codSituacaoEmpresa) : null;
                acc.Situation_Previ__c = cad.cadastro.situacaoPrevi;
                acc.Status_Previ__c = cad.cadastro.statusPrevi;
                acc.Company_Name__c = cad.cadastro.codEmpresa!=null?String.valueOf(cad.cadastro.codEmpresa):null;
                acc.Marital_Status__c = cad.cadastro.idEstadoCivil != null ? String.valueOf(cad.cadastro.idEstadoCivil) : null;
                cont.Document_Number__c = cad.cadastro.codigoNumero != null ? cad.cadastro.codigoNumero : null;
                cont.Document_Type__c = cad.cadastro.tipo != null && (cad.cadastro.tipo).length() > 3 ? (cad.cadastro.tipo).substring(0,2) : null;
                cont.Issue_Date__c = cad.cadastro.emissao != null ? Date.parse(cad.cadastro.emissao) : null;    
                cont.Dispatching_Agency__c = cad.cadastro.orgaoEmissor;
                cont.PisPasep__c = cad.cadastro.pisPasep != null ?String.valueOf(Long.valueOf(cad.cadastro.pisPasep)) : null;
                cont.Fathers_Name__c = cad.cadastro.pai;
                cont.Mothers_Name__c = cad.cadastro.mae;
                cont.Nationality__c = cad.cadastro.nacionalidade;
                cont.Naturalness__c = cad.cadastro.naturalidade;
                acc.Civilian_Capacity__c = cad.cadastro.descCapacCivil;
                //Integração getEmail
                Map<String,Object> returnEmail = !Test.isRunningTest() ? IntegrationUtils.getEmail(matricula) : testAuxiliary2;                
                if(returnEmail.get('statusCode') == 200){
                    IntegrationModels.Email em = (IntegrationModels.Email) JSON.deserialize((String) returnEmail.get('body'), IntegrationModels.Email.class);
                    System.debug('EMAIL >> ' + em);
                    cont.email = em.email ==  null? null : !org.IsSandbox? em.email : (em.email).replace('@','@123test');
                    //cas.ContactEmail = em.email;    
                }
                
                //Integração getEndereço
                Map<String,Object> returnEndereco = !Test.isRunningTest() ? IntegrationUtils.getEndereco(matricula) : testAuxiliary3;
                if(returnEndereco.get('statusCode') == 200){
                    List<IntegrationModels.Enderecos> listEnde = new List<IntegrationModels.Enderecos>();
                    IntegrationModels.Enderecos ende = (IntegrationModels.Enderecos) JSON.deserialize((String) returnEndereco.get('body'), IntegrationModels.Enderecos.class);
                    System.debug('ende >> ' + ende);
                    listEnde.add(ende);
                    acc.District__c = ende.enderecos[0].bairro;
                    acc.BillingStreet = ende.enderecos[0].endereco;

                    cont.MailingStreet = ende.enderecos[0].endereco;

                    Map<String,Object> returnMunicipios = !Test.isRunningTest() ? IntegrationUtils.getMunicipiosBrasileiros() : testAuxiliary5;
                    IntegrationModels.Municipios municipio = (IntegrationModels.Municipios) JSON.deserialize((String) returnMunicipios.get('body'), IntegrationModels.Municipios.class);
                    for(Integer i=0; i<(municipio.municipiosBR).size();i++){
                        if(municipio.municipiosBR[i].idMunicipio == Integer.valueOf(ende.enderecos[0].idMunicipio)){
                            acc.BillingCity = municipio.municipiosBR[i].municipio;

                            cont.MailingCity = municipio.municipiosBR[i].municipio;
                        }
                    }
                    //acc.BillingCity = idMunicipio  USAR INTEGRAÇÃO DE MUNICIPIO
                    acc.BillingCountry = ende.enderecos[0].idPais == null ? null : Integer.valueOf(ende.enderecos[0].idPais) == 1 ? 'Brasil' : 'getPais';
                    acc.BillingPostalCode = ende.enderecos[0].cep;
                    acc.BillingState = ende.enderecos[0].uf;

                    cont.MailingCountry = ende.enderecos[0].idPais == null ? null : Integer.valueOf(ende.enderecos[0].idPais) == 1 ? 'Brasil' : 'getPais';
                    cont.MailingPostalCode = ende.enderecos[0].cep;
                    cont.MailingState = ende.enderecos[0].uf;            
                }
                
                //Integração getOpcoesCorrespondencia
                Map<String,Object> returnOpCorresp = !Test.isRunningTest() ? IntegrationUtils.getOpcoesCorrespondencia(matricula) : testAuxiliary4;
                if(returnOpCorresp.get('statusCode') == 200){
                    IntegrationModels.ListOpcoesCorrespondencia opcoes = (IntegrationModels.ListOpcoesCorrespondencia) JSON.deserialize((String) returnOpCorresp.get('body'), IntegrationModels.ListOpcoesCorrespondencia.class);  
                    if((opcoes.opcoesCorrespondencia).size() > 0){
                        Map<String,String> mapOptions = new Map<String,String>();
                        for(Integer i=0; i<5; i++){
                            String multiPicklist;
                            if(opcoes.opcoesCorrespondencia[i].envioPostal != 'S' && opcoes.opcoesCorrespondencia[i].envioEmail != 'S' && opcoes.opcoesCorrespondencia[i].envioCelular != 'S' ){
                                multiPicklist = 'N/A';                           
                            }else{
                                if(opcoes.opcoesCorrespondencia[i].envioPostal == 'S'){
                                    multiPicklist = 'Postal';
                                }
                                if(opcoes.opcoesCorrespondencia[i].envioEmail == 'S'){
                                    multiPicklist = multiPicklist == null? 'Email' : multiPicklist+';Email';
                                }
                                if(opcoes.opcoesCorrespondencia[i].envioCelular == 'S'){
                                    multiPicklist = multiPicklist == null? 'Celular' : multiPicklist+';Celular';
                                    
                                }
                            }
                            mapOptions.put(String.valueOf(Integer.valueOf(opcoes.opcoesCorrespondencia[i].idCorrespondencia)),multiPicklist);
                        }
                        system.debug('map correspondencia ' + mapOptions);
                        acc.Income_Tax_Statement__c = mapOptions.get('20');
                        acc.Info_Previ__c = mapOptions.get('3');
                        acc.Other_Institutional_Info__c = mapOptions.get('9');
                        acc.Card_Benefits_Club__c = mapOptions.get('11');
                        acc.Other_Promotional_Info__c = mapOptions.get('19');
                    }else{
                        acc.Income_Tax_Statement__c = 'N/A';
                        acc.Info_Previ__c = 'N/A';
                        acc.Other_Institutional_Info__c = 'N/A';
                        acc.Card_Benefits_Club__c = 'N/A';
                        acc.Other_Promotional_Info__c = 'N/A';
                    }            
                }

                //Integração Pessoa Politicamente Exposta
                Map<String,Object> returnPPE = !Test.isRunningTest() ? IntegrationUtils.getPPE(cpf) : testAuxiliary6;
                if(returnPPE.get('statusCode') == 200){
                    System.debug(returnPPE);
                    acc.Pessoa_Politicamente_Exposta__c = ((string) returnPPE.get('body')).length() > 3 ? 'Sim' : 'Não';
                    System.debug('acc.Pessoa_Politicamente_Exposta__c >> ' + acc.Pessoa_Politicamente_Exposta__c);            
                }

                //Integração Telefone
                Map<String,Object> returnTelefones = !Test.isRunningTest() ? IntegrationUtils.getTelefones(matricula) : testAuxiliary7;
                if(returnTelefones.get('statusCode') == 200){
                    IntegrationModels.Telefones telefones = (IntegrationModels.Telefones) JSON.deserialize((String) returnTelefones.get('body'), IntegrationModels.Telefones.class);
                    for(Integer i=0; i<(telefones.telefones).size(); i++){
                        if(telefones.telefones[i].tipo == 'fixo'){
                            cont.DDI__c = telefones.telefones[i].ddi;
                            cont.DDD__c = telefones.telefones[i].ddd;
                            cont.Phone = cont.DDD__c != null ? '(' + cont.DDD__c + ') ' + telefones.telefones[i].telefone : telefones.telefones[i].telefone;
                            cont.Arm__c = telefones.telefones[i].ramal;
                        }else if(telefones.telefones[i].tipo == 'celular'){
                            cont.DDI_Mobile__c = telefones.telefones[i].ddi;
                            cont.DDD_Mobile__c = telefones.telefones[i].ddd;
                            cont.MobilePhone = cont.DDD_Mobile__c != null ? '(' + cont.DDD_Mobile__c + ') ' + telefones.telefones[i].telefone : telefones.telefones[i].telefone;
                        }else if(telefones.telefones[i].tipo == 'fax'){
                            cont.Fax = telefones.telefones[i].telefone;
                        }     
                    }
                }        
                Map<String,String> mapStatus = getStatus(Integer.valueOf(acc.Plan_Code__c), (acc.Situation_Previ__c).toUpperCase(), (acc.Status_Previ__c).toUpperCase(), acc.Situation__c);
                acc.Account_Status__c = mapStatus.get(acc.Situation_Previ__c+acc.Status_Previ__c);
            } 
        }        
       
        //Add Map
        mapObj.put('Account', acc);
        mapObj.put('Contact', cont);

        return mapObj;
    }

    public static Map<String,String> getStatus(Integer codPlan, String situPrevi, String statusPrevi, String situation){
        Map<String,String> mapStatus = new Map<String,String>();
        if((codPlan == 1 || statusPrevi == 'NOR' || situPrevi == 'EXT' || situPrevi == 'BPD' || situPrevi == 'SOP') && situPrevi != 'PESIND'){
            if(situPrevi == 'ATIVO'){
                mapStatus.put(situPrevi+'NOR','ATIVO NORMAL '+codPlan); 
                mapStatus.put(situPrevi+'EXT','ATIVO EXTERNO '+codPlan); 
                mapStatus.put(situPrevi+'BPD','ATIVO BPD '+codPlan); 
                mapStatus.put(situPrevi+'SOP','ATIVO SOP '+codPlan); 
                mapStatus.put(situPrevi+'VES','ATIVO VESTING 1');              
                mapStatus.put(situPrevi+'MIN','ATIVO PENSAO MINIMA 1');   
                if(situation == 'Falecidos'){
                    mapStatus.put(situPrevi,'ATIVO 1 (FALEC. S/PENSAO)');  //FALECIDO 
                }     
            }else if(situPrevi == 'CREDOR'){
                mapStatus.put(situPrevi+'NOR','CREDOR NORMAL '+codPlan); 
                mapStatus.put(situPrevi+'EXT','CREDOR EXTERNO '+codPlan); 
                mapStatus.put(situPrevi+'BPD','CREDOR BPD '+codPlan);
                mapStatus.put(situPrevi+'SOP','CREDOR SOP '+codPlan);  
                mapStatus.put(situPrevi+'VES','CREDOR VESTING  1');               
                mapStatus.put(situPrevi+'MIN','CREDOR MIN 1'); 
                if(situation == 'Falecidos'){
                    mapStatus.put(situPrevi,'CREDOR 1 (FALECIDO)');   //FALECIDO 
                }                
            }else if(situPrevi == 'ENCER'){
                mapStatus.put(situPrevi+'NOR','ENCERRADO NOR '+codPlan); 
                mapStatus.put(situPrevi+'EXT','ENCERRADO EXT '+codPlan); 
                mapStatus.put(situPrevi+'BPD','ENCERRADO BPD '+codPlan); 
                mapStatus.put(situPrevi+'SOP','ENCERRADO SOP '+codPlan); 
                mapStatus.put(situPrevi+'VES','ENCERRADO VEST 1');             
                mapStatus.put(situPrevi+'MIN','ENCERRADO MIN 1'); 
                if(situation == 'Falecidos'){
                    mapStatus.put(situPrevi,'ENCERRADO 1 (FALECIDO)'); //FALECIDO 
                }                
            }else if(situPrevi == 'APOSE'){
                if(situation == 'Falecidos'){
                    mapStatus.put(situPrevi,'APOSE 1 (FALEC. S/PENSAO)');  //FALECIDO 
                }
                mapStatus.put(situPrevi+'NOR','APOSE NORMAL '+codPlan); 
                mapStatus.put(situPrevi+'EXT','APOSE EXTERNO '+codPlan);
                mapStatus.put(situPrevi+'BPD','APOSE BPD '+codPlan);
                mapStatus.put(situPrevi+'SOP','APOSE SOP '+codPlan);
                mapStatus.put(situPrevi+'VES','APOSE VESTING 1');                
                mapStatus.put(situPrevi+'FUN','APOSE FUND. CONTRIB 1');
                mapStatus.put(situPrevi+'BEN','APOSE FUNDO BENEFICÊNCIA 1');
                mapStatus.put(situPrevi+'EXC','APOSE EX-COMBATENTE 1');
                mapStatus.put(situPrevi+'MIN','APOSE PENSÃO MÍNIMA 1');
                mapStatus.put(situPrevi+'FNC','APOSE FUND. Ñ CONTRIB 1');
            }else if(situPrevi == 'PENSAO'){
                mapStatus.put(situPrevi+'NOR','PENSÃO NORMAL '+codPlan);
                mapStatus.put(situPrevi+'EXT','PENSÃO EXTERNO '+codPlan);
                mapStatus.put(situPrevi+'BPD','PENSÃO BPD '+codPlan);
                mapStatus.put(situPrevi+'VES','PENSÃO VESTING 1');                
                mapStatus.put(situPrevi+'MIN','PENSÃO MÍNIMA 1');
                mapStatus.put(situPrevi+'EXC','PENSÃO EX-COMBATENTE 1');
                mapStatus.put(situPrevi+'FUN','PENSÃO FUND CONTRIBUINTE 1');
                mapStatus.put(situPrevi+'FNC','PENSÃO FUND Ñ CONTRIBUINTE 1');
                mapStatus.put(situPrevi+'BEN','PENSÃO FUNDO BENEFICÊNCIA 1');        
            }else if(situPrevi == null && statusPrevi == null){
                if(situation == 'Falecidos'){
                    mapStatus.put(situPrevi+statusPrevi,'Ñ PARTICIP. 1 FALECIDO');
                }else{
                    mapStatus.put(situPrevi+statusPrevi,'Ñ PARTICIPANTE 1');
                }
            }

        }else if(codPlan == 2){
            if(situPrevi == 'ATIVO'){
                mapStatus.put(situPrevi+'PIN','ATIVO PARTIC. INTEGRAL 2');
                mapStatus.put(situPrevi+'PPA','ATIVO PARTIC. PARCIAL 2');
                //mapStatus.put('(em branco)'+'(em branco)','ATIVO 2');
                mapStatus.put(situPrevi,'ATIVO 2 (FALEC. S/PENSÃO)'); //FALECIDO
            }else if(situPrevi == 'INDEF'){ 
                mapStatus.put(situPrevi,'ATIVO 2 (INDEFERIDO)');
            }else if(situPrevi == 'CREDOR'){
                if(situation == 'Falecidos'){
                    mapStatus.put(situPrevi,'CREDOR 2 (FALECIDO)'); // FALECIDO
                }else{
                    mapStatus.put(situPrevi,'CREDOR 2');
                }
                mapStatus.put(situPrevi+'PIN','CREDOR PARTIC. INTEGRAL 2');
                mapStatus.put(situPrevi+'PPA','CREDOR PARTIC. PARCIAL 2');
            }else if(situPrevi == 'ENCER'){
                mapStatus.put(situPrevi+'PIN','ENCERRADO PART INTEGRAL 2');
                mapStatus.put(situPrevi+'PPA','ENCERRADO PART PARCIAL 2');
                if(situation == 'Falecidos'){
                    mapStatus.put(situPrevi,'ENCERRADO 2 (FALECIDO)'); // FALECIDO
                }
            }else if(situPrevi == 'APOSE'){
                mapStatus.put(situPrevi+'PIN','APOSE PARTIC. INTEGRAL 2');
                mapStatus.put(situPrevi+'PPA','APOSE PARTIC. PARCIAL 2');
                //mapStatus.put(situPrevi+'(em branco)','APOSE 2');
                if(situation == 'Falecidos'){
                    mapStatus.put(situPrevi,'APOSE 2 (FALEC. S/PENSÃO)');
                }
            }else if(situPrevi == 'PENSAO'){
                mapStatus.put(situPrevi+'PIN','PENSÃO PART  INTEGRAL 2');
                mapStatus.put(situPrevi+'PPA','PENSÃO PART  PARCIAL 2');
                //mapStatus.put(situPrevi+'(em branco)','PENSÃO 2');
            }else if(situPrevi == 'PESIND'){
                mapStatus.put(situPrevi+'NOR','PESSOA INDICADA NORMAL 2');
                mapStatus.put(situPrevi+'EXT','PESSOA INDICADA EXTERNA 2');
                mapStatus.put(situPrevi+'BPD','PESSOA INDICADA BPD 2');
            }    
        }
        return mapStatus;
    }

    @testVisible
    private static Map<String,Object> testAuxiliary;
    @testVisible
    private static Map<String,Object> testAuxiliary2;
    @testVisible
    private static Map<String,Object> testAuxiliary3;
    @testVisible
    private static Map<String,Object> testAuxiliary4;
    @testVisible
    private static Map<String,Object> testAuxiliary5;
    @testVisible
    private static Map<String,Object> testAuxiliary6;
    @testVisible
    private static Map<String,Object> testAuxiliary7;
}