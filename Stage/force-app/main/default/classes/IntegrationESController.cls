public with sharing class IntegrationESController {
    
    @AuraEnabled(cacheable=true)
    public static List<IntegrationModels.Propostas> getPropostas(String matricula ){
        List<IntegrationModels.Propostas> retorno = null;
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getPropostas(matricula);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        retorno = (List<IntegrationModels.Propostas>) Json.deserialize(Json.serialize(responseBody.get('propostas')), List<IntegrationModels.Propostas>.class);
                    }else{
                        IntegrationModels.Propostas prop = new IntegrationModels.Propostas();
                        prop.erro = true;
                        retorno.add(prop);
                    }
                }
            }
            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    @AuraEnabled(cacheable=true)
    public static List<IntegrationModels.Consulta_devolucao> getDevolucoes(String matricula, String idEmprestimo ){
        List<IntegrationModels.Consulta_devolucao> devolucoes = new List<IntegrationModels.Consulta_devolucao>();
        HttpResponse responseDevolucoes = IntegrationUtils.getDevolucoes(matricula, idEmprestimo);
        
        if(responseDevolucoes.getStatusCode() == 200){
            Map<String,Object> mapBody = (Map<String,Object>)JSON.deserializeUntyped(responseDevolucoes.getBody());
            
            devolucoes = (List<IntegrationModels.Consulta_devolucao>) Json.deserialize(Json.serialize(mapBody.get('consulta_devolucao')), List<IntegrationModels.Consulta_devolucao>.class);
            System.debug('responseBody >> ' + mapBody.get('consulta_devolucao'));
        }        
        
        return devolucoes;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<IntegrationModels.consulta_cobrancas> getCobranca(String matricula, String idEmprestimo ){
        List<IntegrationModels.consulta_cobrancas> retorno = null;
        Try{
            if(matricula != null && idEmprestimo != null) {
                HTTPResponse responseAPI = IntegrationUtils.getCobrancas(matricula, idEmprestimo);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        retorno = (List<IntegrationModels.consulta_cobrancas>) Json.deserialize(Json.serialize(responseBody.get('consulta_cobrancas')), List<IntegrationModels.consulta_cobrancas>.class);
                    }
                }
            }
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
        //return (List<IntegrationModels.consulta_cobrancas>) JSON.deserialize('[{"tipoSuspen":"N","status":"NOR","cobr":"FORH","dataCancel":null,"dataRealEnv":"02-02-2023","dataRetorno":null,"descrRet":null,"pago":"E","valCobrado":333.33},{"tipoSuspen":"N","status":"NOR","cobr":"FORH","dataCancel":null,"dataRealEnv":"03-01-2023","dataRetorno":"13-01-2023","descrRet":"Pago","pago":"S","valCobrado":333.33}]}',  List<IntegrationModels.consulta_cobrancas>.class);
    }
    
    @AuraEnabled(cacheable=true)
    public static IntegrationModels.Extrato getExtrato(String matricula, String idEmprestimo){
        IntegrationModels.Extrato retorno = null;
        Try{
            if(matricula != null && idEmprestimo != null) {
                HTTPResponse responseAPI = IntegrationUtils.getExtrato(matricula,idEmprestimo);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        retorno = (IntegrationModels.Extrato) Json.deserialize(responseAPI.getBody(), IntegrationModels.Extrato.class);                     
                    }else{
                        IntegrationModels.Extrato ext = new IntegrationModels.Extrato();
                        ext.error = true;
                        retorno = ext;
                    }
                }
            }
            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    @AuraEnabled(cacheable=true)
    public static List<IntegrationModels.EmprestimosLiquidados> getEmprestimosLiquidados(String matricula){
        List<IntegrationModels.EmprestimosLiquidados> empLiquidados = new List<IntegrationModels.EmprestimosLiquidados>();
        HttpResponse responseEmprestimosLiquidados = IntegrationUtils.getEmprestimosLiquidados(matricula);
        
        if(responseEmprestimosLiquidados.getStatusCode() == 200){
            Map<String,Object> mapBody = (Map<String,Object>)JSON.deserializeUntyped(responseEmprestimosLiquidados.getBody());
            
            empLiquidados = (List<IntegrationModels.EmprestimosLiquidados>) Json.deserialize(Json.serialize(mapBody.get('emprestimosLiquidados')), List<IntegrationModels.EmprestimosLiquidados>.class);
            System.debug('responseBody >> ' + mapBody.get('emprestimosLiquidados'));
        }        
        
        return empLiquidados;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<IntegrationModels.Modalidades> getModalidades(String matricula ){
        List<IntegrationModels.Modalidades> retorno = null;
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getModalidades(matricula);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        retorno = (List<IntegrationModels.Modalidades>) Json.deserialize(Json.serialize(responseBody.get('modalidades')), List<IntegrationModels.Modalidades>.class);
                    }else{
                        IntegrationModels.Modalidades mod = new IntegrationModels.Modalidades();
                        mod.erro = true;
                        retorno.add(mod); 
                    }
                }
            }
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    @AuraEnabled(cacheable=true)
    public static List<IntegrationModels.Emprestimos> getEmprestimos(String matricula ){
        List<IntegrationModels.Emprestimos> retorno = null;
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getEmprestimos(matricula);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        retorno = (List<IntegrationModels.Emprestimos>) Json.deserialize(Json.serialize(responseBody.get('emprestimos')), List<IntegrationModels.Emprestimos>.class);
                    }else{
                        IntegrationModels.Emprestimos emp = new IntegrationModels.Emprestimos();
                        emp.erro = true;
                        retorno.add(emp);
                    }
                }
            }
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    @AuraEnabled(cacheable=true)
    public static List<IntegrationModels.Consulta_impedimento> getImpedimentos(String matricula ){
        List<IntegrationModels.Consulta_impedimento> retorno = null;
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getImpedimentos(matricula);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        retorno = (List<IntegrationModels.Consulta_impedimento>) Json.deserialize(Json.serialize(responseBody.get('consulta_impedimento')), List<IntegrationModels.Consulta_impedimento>.class);
                    }else{
                        IntegrationModels.Consulta_impedimento impedimento = new IntegrationModels.Consulta_impedimento();
                        impedimento.erro = true;
                        retorno.add(impedimento);
                    }
                }
            }
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    @AuraEnabled(cacheable=true)
    public static List<IntegrationModels.Renegociacao> getRenegociacoes(String matricula ){
        List<IntegrationModels.Renegociacao> retorno = null;
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getRenegociacoes(matricula,'TODOS');
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        retorno = (List<IntegrationModels.Renegociacao>) Json.deserialize(Json.serialize(responseBody.get('propostas')), List<IntegrationModels.Renegociacao>.class);
                    }
                }
            }
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    @AuraEnabled(cacheable=true)
    public static IntegrationModels.responseProposta postPropostas(String matricula, String body, String gravar ){
        IntegrationModels.responseProposta retorno = null;
        Try{
            if(matricula != null && body != '' || body != null) {
                bodyProposta bodyObj = (bodyProposta) Json.deserialize(body, bodyProposta.class);
                
                date dataAUX = date.valueOf(bodyObj.dataPrevistaCredito);
                datetime dateAlt = dataAUX.AddDays(1);
                String dateOutput = dateAlt.format('dd/MM/yyyy');
                system.debug('dateOutput ' + dateOutput);
                bodyObj.dataPrevistaCredito = dateOutput;
                body = JSON.serialize(bodyObj);
                
                HTTPResponse responseAPI = IntegrationUtils.postPropostas(matricula,body,gravar);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        retorno = (IntegrationModels.responseProposta) Json.deserialize(responseAPI.getBody(), IntegrationModels.responseProposta.class);                     
                        
                    }
                }
            }
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    @AuraEnabled(cacheable=true)
    public static List<IntegrationModels.Anotacoes> getAnotacao(String matricula ){
        List<IntegrationModels.Anotacoes> retorno = null;
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getAnotacao(matricula);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        if(responseBody.get('erro') == null){
                            retorno = (List<IntegrationModels.Anotacoes>) Json.deserialize(Json.serialize(responseBody.get('anotacoes')), List<IntegrationModels.Anotacoes>.class);
                        }
                    }
                }
            }
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    @AuraEnabled(cacheable=true)
    public static IntegrationModels.renegCondic getRenegCondic(String matricula, String idEmprestimo){
        IntegrationModels.renegCondic retorno = null;
        Try{
            if(matricula != null && idEmprestimo != null) {
                HTTPResponse responseAPI = IntegrationUtils.getRenegCondic(matricula,idEmprestimo);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        retorno = (IntegrationModels.renegCondic) Json.deserialize(responseAPI.getBody(), IntegrationModels.renegCondic.class);                     
                    }
                }
            }
            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    @AuraEnabled(cacheable=true)
    public static IntegrationModels.Limites getLimites(String matricula, String idEmprestimosPrevi, String idEmprestimosBB, String modalidade, String dataPrevistaCredito){
        IntegrationModels.Limites retorno = null;
        Try{
            if(matricula != null && modalidade != null && dataPrevistaCredito != null) {
                system.debug('dataPrevistaCredito ' + dataPrevistaCredito);
                date dataAUX = date.valueOf(dataPrevistaCredito);
                datetime dateAlt = dataAUX.AddDays(1);
                String dateOutput = dateAlt.format('dd/MM/yyyy');
                system.debug('dateOutput ' + dateOutput);

                HTTPResponse responseAPI = IntegrationUtils.getLimites(matricula,idEmprestimosPrevi,idEmprestimosBB,modalidade,dateOutput);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        retorno = (IntegrationModels.Limites) Json.deserialize(responseAPI.getBody(), IntegrationModels.Limites.class);                     
                    }else{
                        IntegrationModels.Limites limt = new IntegrationModels.Limites();
                        limt.error = true;
                        retorno = limt;
                    }
                }
            }
            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    @AuraEnabled(cacheable=true)
    public static List<IntegrationModels.Consulta_suspensao> getSuspensaoPagamentos(String matricula ){
        List<IntegrationModels.Consulta_suspensao> retorno = null;
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getSuspensaoPagamentos(matricula);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        if(responseBody.get('erro') == null){
                            retorno = (List<IntegrationModels.Consulta_suspensao>) Json.deserialize(Json.serialize(responseBody.get('consulta_suspensao')), List<IntegrationModels.Consulta_suspensao>.class);
                        }
                    }else{
                        IntegrationModels.Consulta_suspensao suspensao = new IntegrationModels.Consulta_suspensao();
                        suspensao.erro = true;
                        retorno.add(suspensao);
                    }
                }
            }
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    @AuraEnabled(cacheable=true)
    public static List<IntegrationModels.Consulta_impedimento_audit> getInformacoesAuditorias(String matricula ){
        List<IntegrationModels.Consulta_impedimento_audit> retorno = null;
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getInformacoesAuditorias(matricula);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        if(responseBody.get('erro') == null){
                            retorno = (List<IntegrationModels.Consulta_impedimento_audit>) Json.deserialize(Json.serialize(responseBody.get('consulta_impedimento_audit')), List<IntegrationModels.Consulta_impedimento_audit>.class);
                        }
                    }else{
                        IntegrationModels.Consulta_impedimento_audit impedimentoAud = new IntegrationModels.Consulta_impedimento_audit();
                        impedimentoAud.erro = true;
                        retorno.add(impedimentoAud);
                    }
                }
            }
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    @AuraEnabled(cacheable=true)
    public static List<IntegrationModels.opcoesPg> getOpcaoPagamento(String matricula, String modalidade, String dataPrevistaCredito, String valorEmprestimo, String prazo, String valorPrestacao){
        List<IntegrationModels.opcoesPg> retorno = new List<IntegrationModels.opcoesPg>();
        Try{
            if(matricula != '' && modalidade != '' && dataPrevistaCredito != '') {
                system.debug(matricula + ' - ' + modalidade + ' - '+ dataPrevistaCredito + 'valor emp ' + valorEmprestimo);
                
                date dataAUX = date.valueOf(dataPrevistaCredito);
                datetime dateAlt = dataAUX.AddDays(1);
                String dateOutput = dateAlt.format('dd/MM/yyyy');
                
                HTTPResponse responseAPI = IntegrationUtils.getOpcaoPagamento(matricula,modalidade,dateOutput,valorEmprestimo,prazo,valorPrestacao);
                 system.debug('responseAPI ' + responseAPI);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                     Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());                    
                       if(responseBody.get('erro') == null){
                            retorno = (List<IntegrationModels.opcoesPg>) Json.deserialize(Json.serialize(responseBody.get('opcoes')), List<IntegrationModels.opcoesPg>.class);  
                            system.debug('retorno ' + retorno);
                       }else{
                           IntegrationModels.opcoesPg opc = new IntegrationModels.opcoesPg();
                           opc.erro = Json.serializePretty((responseBody.get('erro')));
                           opc.valorEmprestimo = 0;
                           opc.valorPrestacao= 0;
                           opc.prazo= 0;
                           opc.error = false;
                           system.debug('erroAlert ' + opc);
                           retorno.add(opc);
                       }

                    }else{
                        IntegrationModels.opcoesPg op = new IntegrationModels.opcoesPg();
                        op.error = true;
                        retorno.add(op);
                    }
                }
            }
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    @AuraEnabled(cacheable=true)
    public static IntegrationModels.lqAmtInformacao getLqAmtInformacao(String matricula, String idEmprestimo, String valorAmortizacao, String dataEvento){
        IntegrationModels.lqAmtInformacao retorno = null;
        Try{
            if(matricula != null && idEmprestimo != null && dataEvento != null) { 
                date dataAUX = date.valueOf(dataEvento);
                datetime dateAlt = dataAUX.AddDays(1);
                String dateOutput = dateAlt.format('dd/MM/yyyy');
                
                HTTPResponse responseAPI = IntegrationUtils.getLqAmtInformacao(matricula,idEmprestimo,valorAmortizacao,dateOutput);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        retorno = (IntegrationModels.lqAmtInformacao) Json.deserialize(responseAPI.getBody(), IntegrationModels.lqAmtInformacao.class);                     
                    }else{
                        IntegrationModels.lqAmtInformacao lmInfo = new IntegrationModels.lqAmtInformacao();
                        lmInfo.erro = true;
                        retorno = lmInfo;
                    }
                }
            }
            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    @AuraEnabled(cacheable=true)
    public static IntegrationModels.dadosAssocciado getDadosAssociados(String matricula){
        IntegrationModels.dadosAssocciado retorno = null;
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getDadosAssociados(matricula);
                if(responseAPI != null){
                    if(responseAPI.getStatusCode() == 200){
                        retorno = (IntegrationModels.dadosAssocciado) Json.deserialize(responseAPI.getBody(), IntegrationModels.dadosAssocciado.class);                     
                    }else{
                       
                        IntegrationModels.dadosAssocciado dadosAss = new IntegrationModels.dadosAssocciado();
                        dadosAss.erro = true;
                        system.debug('entrou dadosAss ' + dadosAss + ' responseAPI ' + responseAPI);
                        retorno = dadosAss;
                    }
                }
            }
            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
    
    
    
    
    @AuraEnabled        
    public static String getRegistration(String recordId){
        String retorno = '';
        Account matricula = [Select Registration__c FROM Account WHERE Id = :recordId];      
        if(matricula != null){
            retorno = matricula.Registration__c; 
        }
        system.debug('retorno ' + retorno);
        return retorno;
    }
    
    
    @AuraEnabled        
    public static List<returnTabPropostas> carregandoTabProposta(String matricula,String listPropostas){
        List<returnTabPropostas> retorno = new List<returnTabPropostas>();
        List<IntegrationModels.Emprestimos> emprestimos;
        
        Set<string> retAtual = new Set<string>();
        returnTabPropostas ret = new returnTabPropostas();
        Map<string,IntegrationModels.Propostas> mapProp = new Map<string,IntegrationModels.Propostas>();
        try{
            List<IntegrationModels.Propostas> propostas = (List<IntegrationModels.Propostas>) Json.deserialize(listPropostas, List<IntegrationModels.Propostas>.class);                     
            if(Test.isRunningTest()){
               String empr = '[{"id":2712641,"idModalidade":249,"idModalidadeNova":262,"siglaModalidade":"ES-B 140 PLANO2","dataSaldoDevedor":"31/03/2023","valorSaldoDevedor":2339.35,"valorSaldoDevedorAtual":2394.28,"valorSaldoTaxaAdministracao":0,"qtdPrestacoesTaxaAdministracao":null,"valorPrestacao":32.53,"dataCredito":"30/09/2022","valorSolicitado":2458.89,"valorCredito":1080.61,"prazo":120,"indicativoEmprestimoProposta":"EMP","indicativoAgendaLiquidez":"N","indicativoCheckLiquidez":null,"qtdPrestacoesIniciais":120,"qtdPrestacoesPagas":6,"qtdPrestacoesInadimplentes":0,"qtdPrestacoesInadimpConsecutivas":0,"qtdPrestacoesCobradas":7,"qtdPrestacoesRefinanciadas":null,"qtdPrestacoesRestantes":113,"qtdPrestacoesCobradasRefinanciadas":null,"dataRefinanciamento":null,"dataSolicitacaoEmprestimo":"28/09/2022","situacaoEmprestimo":null,"numContratoSistemaAnterior":null,"codigoGrupoModalidade":"ROTATIVO","percentualIOF":2.9927,"indicativoConcessaoAtiva":"S","carencia":false,"msgCarencia":null},{"id":2786847,"idModalidade":264,"idModalidadeNova":264,"siglaModalidade":"ES-D 160 PLANO2","dataSaldoDevedor":"31/03/2023","valorSaldoDevedor":2738.3,"valorSaldoDevedorAtual":2802.59,"valorSaldoTaxaAdministracao":0,"qtdPrestacoesTaxaAdministracao":null,"valorPrestacao":36.25,"dataCredito":"13/02/2023","valorSolicitado":2734.96,"valorCredito":583.79,"prazo":120,"indicativoEmprestimoProposta":"EMP","indicativoAgendaLiquidez":"N","indicativoCheckLiquidez":null,"qtdPrestacoesIniciais":120,"qtdPrestacoesPagas":1,"qtdPrestacoesInadimplentes":0,"qtdPrestacoesInadimpConsecutivas":0,"qtdPrestacoesCobradas":2,"qtdPrestacoesRefinanciadas":null,"qtdPrestacoesRestantes":118,"qtdPrestacoesCobradasRefinanciadas":null,"dataRefinanciamento":null,"dataSolicitacaoEmprestimo":"09/02/2023","situacaoEmprestimo":null,"numContratoSistemaAnterior":null,"codigoGrupoModalidade":"ROTATIVO","percentualIOF":2.9927,"indicativoConcessaoAtiva":"S","carencia":true,"msgCarencia":"A quantidade de prestações pagas é insuficiente para renovar. Aguarde a quitação de mais 5 parcela(s) mensal(is)."},{"id":2598364,"idModalidade":241,"idModalidadeNova":263,"siglaModalidade":"ES-C 120 PLANO2","dataSaldoDevedor":"31/03/2023","valorSaldoDevedor":1417.48,"valorSaldoDevedorAtual":1450.75,"valorSaldoTaxaAdministracao":0,"qtdPrestacoesTaxaAdministracao":null,"valorPrestacao":19.54,"dataCredito":"04/03/2022","valorSolicitado":1479.58,"valorCredito":68.29,"prazo":120,"indicativoEmprestimoProposta":"EMP","indicativoAgendaLiquidez":"N","indicativoCheckLiquidez":null,"qtdPrestacoesIniciais":120,"qtdPrestacoesPagas":12,"qtdPrestacoesInadimplentes":0,"qtdPrestacoesInadimpConsecutivas":0,"qtdPrestacoesCobradas":13,"qtdPrestacoesRefinanciadas":null,"qtdPrestacoesRestantes":107,"qtdPrestacoesCobradasRefinanciadas":null,"dataRefinanciamento":null,"dataSolicitacaoEmprestimo":"02/03/2022","situacaoEmprestimo":null,"numContratoSistemaAnterior":null,"codigoGrupoModalidade":"ROTATIVO","percentualIOF":2.9974,"indicativoConcessaoAtiva":"S","carencia":false,"msgCarencia":null},{"id":2612135,"idModalidade":239,"idModalidadeNova":261,"siglaModalidade":"ES-A 120 PLANO2","dataSaldoDevedor":"31/03/2023","valorSaldoDevedor":31882.44,"valorSaldoDevedorAtual":32630.91,"valorSaldoTaxaAdministracao":0,"qtdPrestacoesTaxaAdministracao":null,"valorPrestacao":433.11,"dataCredito":"25/04/2022","valorSolicitado":33573.15,"valorCredito":2633.31,"prazo":120,"indicativoEmprestimoProposta":"EMP","indicativoAgendaLiquidez":"N","indicativoCheckLiquidez":null,"qtdPrestacoesIniciais":120,"qtdPrestacoesPagas":11,"qtdPrestacoesInadimplentes":0,"qtdPrestacoesInadimpConsecutivas":0,"qtdPrestacoesCobradas":12,"qtdPrestacoesRefinanciadas":null,"qtdPrestacoesRestantes":108,"qtdPrestacoesCobradasRefinanciadas":null,"dataRefinanciamento":null,"dataSolicitacaoEmprestimo":"20/04/2022","situacaoEmprestimo":null,"numContratoSistemaAnterior":null,"codigoGrupoModalidade":"ROTATIVO","percentualIOF":2.9931,"indicativoConcessaoAtiva":"S","carencia":false,"msgCarencia":null},{"id":2782819,"idModalidade":208,"idModalidadeNova":208,"siglaModalidade":"ES13º PL2","dataSaldoDevedor":"31/03/2023","valorSaldoDevedor":376.27,"valorSaldoDevedorAtual":384.9,"valorSaldoTaxaAdministracao":0,"qtdPrestacoesTaxaAdministracao":null,"valorPrestacao":null,"dataCredito":"02/02/2023","valorSolicitado":369.42,"valorCredito":364.88,"prazo":1,"indicativoEmprestimoProposta":"EMP","indicativoAgendaLiquidez":"N","indicativoCheckLiquidez":null,"qtdPrestacoesIniciais":1,"qtdPrestacoesPagas":0,"qtdPrestacoesInadimplentes":0,"qtdPrestacoesInadimpConsecutivas":0,"qtdPrestacoesCobradas":1,"qtdPrestacoesRefinanciadas":null,"qtdPrestacoesRestantes":0,"qtdPrestacoesCobradasRefinanciadas":null,"dataRefinanciamento":null,"dataSolicitacaoEmprestimo":"31/01/2023","situacaoEmprestimo":null,"numContratoSistemaAnterior":null,"codigoGrupoModalidade":"ESDECTERC","percentualIOF":0.6307,"indicativoConcessaoAtiva":"N","carencia":false,"msgCarencia":null}]';
               emprestimos = (List<IntegrationModels.Emprestimos>) Json.deserialize(empr, List<IntegrationModels.Emprestimos>.class);
            }else{
            emprestimos = getEmprestimos(matricula);
            }
            if(propostas.size() > 0){
                for (IntegrationModels.Propostas prop : propostas) {
                    if(!mapProp.containsKey(String.valueOf(prop.id))){
                        mapProp.put(String.valueOf(prop.id),prop);
                    }
                }
                if(emprestimos.size() > 0){
                    for(IntegrationModels.Emprestimos emp : emprestimos){
                        if(emp.erro != true){
                            String empId = String.valueOf(double.valueOf(emp.id)).substringBefore('.');
                            if(mapProp.containsKey(empId)){
                                if(!retAtual.contains(empId)){
                                    ret = new returnTabPropostas();
                                    ret.id = String.valueof(mapProp.get(empId).id);
                                    ret.modalidade = mapProp.get(empId).modalidade;
                                    ret.valorSolicitado = mapProp.get(empId).valorSolicitado;
                                    ret.dataPrevistaCredito = mapProp.get(empId).dataPrevistaCredito;
                                    ret.situacaoProposta = mapProp.get(empId).situacaoProposta;
                                    ret.dataSolicitacao = mapProp.get(empId).dataSolicitacao;
                                    ret.valorTaxaAdmin = mapProp.get(empId).valorTaxaAdmin;
                                    ret.valorIOF = mapProp.get(empId).valorIOF;
                                    ret.valFQM = mapProp.get(empId).valFQM;
                                    ret.valorCredito = mapProp.get(empId).valorCredito;
                                    ret.protocoloCadas = mapProp.get(empId).protocoloCadas;
                                    ret.protocoloCancel = mapProp.get(empId).protocoloCancel;
                                    ret.ESLiquidado = mapProp.get(empId).ESLiquidado;
                                    ret.verbasPAS = mapProp.get(empId).verbasPAS;
                                    ret.valDivFinancImob = mapProp.get(empId).valDivFinancImob;
                                    ret.valDivPrevi= mapProp.get(empId).valDivPrevi;
                                    ret.agenciaCreditada = mapProp.get(empId).agenciaCreditada;
                                    ret.contaCreditada = mapProp.get(empId).contaCreditada;
                                    ret.indOrigemPropos = mapProp.get(empId).indOrigemPropos;
                                    ret.dataPrevistaFimEmprestimo = mapProp.get(empId).dataPrevistaFimEmprestimo;
                                    ret.dataSaldoDevedor = emp.dataSaldoDevedor;
                                    ret.valorSaldoDevedorAtual= emp.valorSaldoDevedorAtual;
                                    ret.indicativoEmprestimoProposta= emp.indicativoEmprestimoProposta;
                                    ret.qtdPrestacoesInadimpConsecutivas= emp.qtdPrestacoesInadimpConsecutivas;
                                    retorno.add(ret);
                                    retAtual.add(empId);                                  
                                }
                                
                            }
                        }
                    }
                    for(IntegrationModels.Propostas prop :propostas){
                        if(!retAtual.contains(String.valueOf(prop.id))){
                            ret = new returnTabPropostas();
                            ret.id = prop.id != null ? String.valueOf(prop.id) : '';
                            ret.modalidade = prop.modalidade ;
                            ret.valorSolicitado = prop.valorSolicitado;
                            ret.dataPrevistaCredito = prop.dataPrevistaCredito;
                            ret.situacaoProposta = prop.situacaoProposta;
                            ret.dataSolicitacao = prop.dataSolicitacao;
                            ret.valorTaxaAdmin = prop.valorTaxaAdmin;
                            ret.valorIOF = prop.valorIOF;
                            ret.valFQM = prop.valFQM;
                            ret.valorCredito = prop.valorCredito;
                            ret.protocoloCadas = prop.protocoloCadas;
                            ret.protocoloCancel = prop.protocoloCancel;
                            ret.ESLiquidado = prop.ESLiquidado;
                            ret.verbasPAS = prop.verbasPAS;
                            ret.valDivFinancImob = prop.valDivFinancImob;
                            ret.valDivPrevi= prop.valDivPrevi;
                            ret.agenciaCreditada = prop.agenciaCreditada;
                            ret.contaCreditada = prop.contaCreditada;
                            ret.indOrigemPropos = prop.indOrigemPropos;
                            ret.dataPrevistaFimEmprestimo = prop.dataPrevistaFimEmprestimo;
                            ret.dataSaldoDevedor = '';
                            ret.valorSaldoDevedorAtual= '';
                            ret.indicativoEmprestimoProposta= '';
                            ret.qtdPrestacoesInadimpConsecutivas= '';                           
                            retorno.add(ret);  
                        }
                    }
                }else{
                    for(IntegrationModels.Propostas prop :propostas){
                        ret = new returnTabPropostas();
                        ret.id = prop.id != null ? String.valueOf(prop.id) : '';
                        ret.modalidade = prop.modalidade ;
                        ret.valorSolicitado = prop.valorSolicitado;
                        ret.dataPrevistaCredito = prop.dataPrevistaCredito;
                        ret.situacaoProposta = prop.situacaoProposta;
                        ret.dataSolicitacao = prop.dataSolicitacao;
                        ret.valorTaxaAdmin = prop.valorTaxaAdmin;
                        ret.valorIOF = prop.valorIOF;
                        ret.valFQM = prop.valFQM;
                        ret.valorCredito = prop.valorCredito;
                        ret.protocoloCadas = prop.protocoloCadas;
                        ret.protocoloCancel = prop.protocoloCancel;
                        ret.ESLiquidado = prop.ESLiquidado;
                        ret.verbasPAS = prop.verbasPAS;
                        ret.valDivFinancImob = prop.valDivFinancImob;
                        ret.valDivPrevi= prop.valDivPrevi;
                        ret.agenciaCreditada = prop.agenciaCreditada;
                        ret.contaCreditada = prop.contaCreditada;
                        ret.indOrigemPropos = prop.indOrigemPropos;
                        ret.dataPrevistaFimEmprestimo = prop.dataPrevistaFimEmprestimo;
                        ret.dataSaldoDevedor = '';
                        ret.valorSaldoDevedorAtual= '';
                        ret.indicativoEmprestimoProposta= '';
                        ret.qtdPrestacoesInadimpConsecutivas= '';
                        retorno.add(ret);  
                    }
                }
            }else{
                //Não há proposta só emprestimos.
                if(emprestimos.size() > 0){
                    for(IntegrationModels.Emprestimos emp : emprestimos){
                        if(emp.erro != true){
                            if(!retAtual.contains(String.valueOf(emp.id))){
                                ret = new returnTabPropostas();
                                ret.dataSaldoDevedor = emp.dataSaldoDevedor;
                                ret.valorSaldoDevedorAtual = emp.valorSaldoDevedorAtual;
                                ret.indicativoEmprestimoProposta = emp.indicativoEmprestimoProposta;
                                ret.qtdPrestacoesInadimpConsecutivas = emp.qtdPrestacoesInadimpConsecutivas;
                                retorno.add(ret);
                                retAtual.add(ret.id);
                            }
                        }
                    }
                }
            }
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return retorno; 
    }
 
    @AuraEnabled  
    public static dateTime getDataEntrada(){
        
        BusinessHours bh = [ SELECT  Id, Name FROM BusinessHours where Name = 'EmprestimoSimples'];            
        DateTime dt = Datetime.now();
        //system.debug('dt ' + dt);
        time horaAtual = dt.time();
        DateTime dataMock;
        
        if(BusinessHours.isWithin(bh.id, dt)){
            if(horaAtual > = Time.newInstance(15, 0, 0, 0)){
                //system.debug('maior 15h + 3 dias');
                dataMock = dataUtil(dt,bh.id, 3);
            }else{
                //system.debug('menor 15h  + 2 dias '); 
                dataMock = dataUtil(dt,bh.id, 2);
            } 
          
        }else{
            Datetime nextStart = BusinessHours.nextStartDate(bh.id,dt);  
            dataMock = dataUtil(nextStart.date(),bh.id, 2);
            //system.debug('feriado, final de semana - Proximo dia util + 2 dias');

        }

        return dataMock;
    }
    

    public static dateTime dataUtil(Datetime startDate,String bhId, Integer num){
        DateTime startDat = startDate.addDays(1);
        DateTime retorno;
        Integer contJ = 0;
        Integer contFor = 0;
        for(Integer i=0; contJ <= num; i++){
            if(BusinessHours.isWithin(bhId, startDat)){
                contJ++;
                retorno = startDat;
                startDat = startDat.addDays(1);
            }else{
                startDat = startDat.addDays(1);
            }
          if(contFor == 31){
                break;
            }
            contFor++;
            i++;
        }
        return retorno;
    }
    
    public class returnTabPropostas {
        @AuraEnabled public String id {get; set;}
        @AuraEnabled public String modalidade{get; set;}
        @AuraEnabled public Double valorSolicitado{get; set;}
        @AuraEnabled public String dataPrevistaCredito{get; set;}
        @AuraEnabled public String situacaoProposta{get; set;}
        @AuraEnabled public String dataSolicitacao{get; set;}
        @AuraEnabled public Double valorTaxaAdmin{get; set;}
        @AuraEnabled public Double valorIOF{get; set;}
        @AuraEnabled public Double valFQM{get; set;}
        @AuraEnabled public Double valorCredito{get; set;}
        @AuraEnabled public String protocoloCadas{get; set;}
        @AuraEnabled public String protocoloCancel{get; set;}
        @AuraEnabled public Double ESLiquidado{get; set;}
        @AuraEnabled public Double verbasPAS{get; set;}
        @AuraEnabled public Double valDivFinancImob{get; set;}
        @AuraEnabled public Double valDivPrevi{get; set;}
        @AuraEnabled public String agenciaCreditada{get; set;}
        @AuraEnabled public String contaCreditada{get; set;}
        @AuraEnabled public String indOrigemPropos{get; set;}
        @AuraEnabled public String dataPrevistaFimEmprestimo{get; set;}
        @AuraEnabled public String dataSaldoDevedor{get; set;}
        @AuraEnabled public String valorSaldoDevedorAtual{get; set;}
        @AuraEnabled public String indicativoEmprestimoProposta{get; set;}
        @AuraEnabled public String qtdPrestacoesInadimpConsecutivas{get; set;}
        @AuraEnabled public Boolean erro{get; set;}
    }
    
        public class bodyProposta {
        @AuraEnabled public String modalidade{get; set;}
        @AuraEnabled public String dataPrevistaCredito{get; set;}
        @AuraEnabled public String valorEmprestimo{get; set;}
        @AuraEnabled public String valorPrestacao{get; set;}
        @AuraEnabled public String prazo{get; set;}
        @AuraEnabled public String idEmprestimosPreviImpactados{get; set;}
        @AuraEnabled public String idEmprestimosBBImpactados{get; set;}      
    }
    
}