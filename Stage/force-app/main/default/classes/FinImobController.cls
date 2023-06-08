public with sharing class FinImobController {
    @AuraEnabled        
    public static String getRegistration(String recordId){
        String retorno = '';
        Account matricula = [Select Registration__c FROM Account WHERE Id = :recordId];      
        if(matricula != null){
            retorno = matricula.Registration__c; 
        }
        return retorno;
    }

    @AuraEnabled
    public static List<IntegrationModels.Contrato> getContratos(String matricula){
        List<IntegrationModels.Contrato> contratos = new List<IntegrationModels.Contrato>();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getContratos(matricula);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        contratos = (List<IntegrationModels.Contrato>) Json.deserialize(responseAPI.getBody(), List<IntegrationModels.Contrato>.class);
                        System.debug('contratos size>> ' + contratos.size());       

                    }
                }
            }
            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return contratos; 
    }

    @AuraEnabled
    public static IntegrationModels.DadosFinanciamento getDadosFin(String matricula){
        IntegrationModels.DadosFinanciamento dadosFin = new IntegrationModels.DadosFinanciamento();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getDadosFin(matricula);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        dadosFin = (IntegrationModels.DadosFinanciamento) Json.deserialize(responseAPI.getBody(), IntegrationModels.DadosFinanciamento.class);
                        dadosFin.intQntTotPrest = Integer.ValueOf(dadosFin.quantidadeTotalPrestacoes);
                        dadosFin.intQntPrestRest = Integer.ValueOf(dadosFin.quantidadePrestacoesRestantes);                       
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        
        return dadosFin; 
    }

    @AuraEnabled
    public static IntegrationModels.DevedoresSolidarios getDevedorSolidario(String matricula, String idContrato){
        List<IntegrationModels.DevedoresSolidarios> devedoresSolidarios = new List<IntegrationModels.DevedoresSolidarios>();
        IntegrationModels.DevedoresSolidarios devedorSolidario = new IntegrationModels.DevedoresSolidarios();
        Try{
            if(matricula != null && idContrato != null) {
                HTTPResponse responseAPI = IntegrationUtils.getDevedorSolidario(matricula, idContrato);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        devedoresSolidarios = (List<IntegrationModels.DevedoresSolidarios>) Json.deserialize(Json.serialize(responseBody.get('consulta_dev_solidario')), List<IntegrationModels.DevedoresSolidarios>.class);
                        System.debug('devedor >> ' +devedoresSolidarios);
                        devedorSolidario.codigo_devedor = devedoresSolidarios[0].codigo_devedor;
                        devedorSolidario.nom_pessoa = devedoresSolidarios[0].nom_pessoa;
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }
        
        return devedorSolidario; 
    }

    @AuraEnabled
    public static IntegrationModels.Liquidacoes getLiquidacoes(String matricula, String idContrato){
        List<IntegrationModels.Liquidacoes> listLiquidacoes = new List<IntegrationModels.Liquidacoes>();
        IntegrationModels.Liquidacoes liquidacoes = new IntegrationModels.Liquidacoes();
        Try{
            if(matricula != null && idContrato != null) {
                HTTPResponse responseAPI = IntegrationUtils.getLiquidacoes(matricula, idContrato);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        listLiquidacoes = (List<IntegrationModels.Liquidacoes>) Json.deserialize(Json.serialize(responseBody.get('consulta_cadastro_liquidacoes')), List<IntegrationModels.Liquidacoes>.class);
                        liquidacoes.tipo_liqd = listLiquidacoes[0].tipo_liqd;
                        liquidacoes.data_liqd = listLiquidacoes[0].data_liqd;
                        liquidacoes.data_baixa = listLiquidacoes[0].data_baixa;
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }
        
        return liquidacoes; 
    }

    @AuraEnabled
    public static List<IntegrationModels.Impedimentos> getImpedimentos(String matricula, String idContrato){
        List<IntegrationModels.Impedimentos> impedimentos = new List<IntegrationModels.Impedimentos>();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getImpedimentosFI(matricula, idContrato);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        impedimentos = (List<IntegrationModels.Impedimentos>) Json.deserialize(Json.serialize(responseBody.get('consulta_cadastro_impedimentos')), List<IntegrationModels.Impedimentos>.class);
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return impedimentos; 
    }

    @AuraEnabled
    public static List<IntegrationModels.AnotacoesFI> getAnotacoes(String matricula, String idContrato){
        List<IntegrationModels.AnotacoesFI> anotacoes = new List<IntegrationModels.AnotacoesFI>();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getAnotacoesFI(matricula, idContrato);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        anotacoes = (List<IntegrationModels.AnotacoesFI>) Json.deserialize(Json.serialize(responseBody.get('consulta_anotacoes')), List<IntegrationModels.AnotacoesFI>.class);
                    }
                }
            }   
            for (IntegrationModels.AnotacoesFI aux : anotacoes) {
                System.debug(aux.dsc_anotac_cfi);
                //anotacoes.dscResume = aux.dsc_anotac_cfi.abbreviate(10);
            }
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return anotacoes; 
    }

    @AuraEnabled
    public static List<IntegrationModels.Condominos> getCondominos(String matricula, String idContrato){
        List<IntegrationModels.Condominos> condominos = new List<IntegrationModels.Condominos>();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getCondominos(matricula, idContrato);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        condominos = (List<IntegrationModels.Condominos>) Json.deserialize(Json.serialize(responseBody.get('consulta_condomino')), List<IntegrationModels.Condominos>.class);
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return condominos; 
    }

    @AuraEnabled
    public static IntegrationModels.Seguros getSeguros(String matricula, String idContrato){
        IntegrationModels.Seguros seguros = new IntegrationModels.Seguros();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getSeguros(matricula, idContrato);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        seguros = (IntegrationModels.Seguros) Json.deserialize(responseAPI.getBody(), IntegrationModels.Seguros.class);                                           
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        
        return seguros; 
    }

    @AuraEnabled
    public static List<IntegrationModels.CobrancasFI> getCobrancasSeguro(String matricula, String idContrato){
        List<IntegrationModels.CobrancasFI> cobrancas = new List<IntegrationModels.CobrancasFI>();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getCobrancasFI(matricula, idContrato, 'ACE');
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        cobrancas = (List<IntegrationModels.CobrancasFI>) Json.deserialize(Json.serialize(responseBody.get('consulta_detalhe')), List<IntegrationModels.CobrancasFI>.class);
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return cobrancas; 
    }

    @AuraEnabled
    public static List<IntegrationModels.CobrancasFI> getCobrancasExtrato(String matricula, String idContrato){
        List<IntegrationModels.CobrancasFI> cobrancas = new List<IntegrationModels.CobrancasFI>();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getCobrancasFI(matricula, idContrato, 'AMT');
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        cobrancas = (List<IntegrationModels.CobrancasFI>) Json.deserialize(Json.serialize(responseBody.get('consulta_detalhe')), List<IntegrationModels.CobrancasFI>.class);
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return cobrancas; 
    }

    @AuraEnabled
    public static List<IntegrationModels.ExtratoFI> getExtrato(String matricula, String idContrato){
        List<IntegrationModels.ExtratoFI> extrato = new List<IntegrationModels.ExtratoFI>();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getExtratoFI(matricula, idContrato);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        extrato = (List<IntegrationModels.ExtratoFI>) Json.deserialize(Json.serialize(responseBody.get('extrato')), List<IntegrationModels.ExtratoFI>.class);
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return extrato; 
    }

    @AuraEnabled
    public static List<IntegrationModels.Atrasos> getAtrasos(String matricula, String idContrato){
        List<IntegrationModels.Atrasos> atrasos = new List<IntegrationModels.Atrasos>();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getAtrasos(matricula, idContrato);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        atrasos = (List<IntegrationModels.Atrasos>) Json.deserialize(Json.serialize(responseBody.get('consulta_prestacoes_atraso')), List<IntegrationModels.Atrasos>.class);
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return atrasos; 
    }

    @AuraEnabled
    public static List<IntegrationModels.Devolucoes> getDevolucoes(String matricula, String idContrato){
        List<IntegrationModels.Devolucoes> devolucoes = new List<IntegrationModels.Devolucoes>();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getDevolucoesFI(matricula, idContrato);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        devolucoes = (List<IntegrationModels.Devolucoes>) Json.deserialize(Json.serialize(responseBody.get('consulta_devolucoes')), List<IntegrationModels.Devolucoes>.class);
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return devolucoes; 
    }

    @AuraEnabled
    public static List<IntegrationModels.CreditoSinal> getCreditoSinal(String matricula, String idContrato){
        List<IntegrationModels.CreditoSinal> creditoSinal = new List<IntegrationModels.CreditoSinal>();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getCreditoSinal(matricula, idContrato);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        creditoSinal = (List<IntegrationModels.CreditoSinal>) Json.deserialize(Json.serialize(responseBody.get('consulta_credito_sinal')), List<IntegrationModels.CreditoSinal>.class);
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return creditoSinal; 
    }

    @AuraEnabled
    public static List<IntegrationModels.Fgts> getFgts(String matricula, String idContrato){
        List<IntegrationModels.Fgts> fgts = new List<IntegrationModels.Fgts>();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getFgts(matricula, idContrato);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        fgts = (List<IntegrationModels.Fgts>) Json.deserialize(Json.serialize(responseBody.get('consulta_fgts')), List<IntegrationModels.Fgts>.class);
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return fgts; 
    }

    @AuraEnabled
    public static IntegrationModels.Carta getCarta(String matricula){
        IntegrationModels.Carta carta = new IntegrationModels.Carta();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getCarta(matricula);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        carta = (IntegrationModels.Carta) Json.deserialize(responseAPI.getBody(), IntegrationModels.Carta.class);                                           
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }       
        return carta; 
    }

    @AuraEnabled
    public static List<IntegrationModels.HistoricoImpedimentos> getHistoricoImpedimentos(String matricula){
        List<IntegrationModels.HistoricoImpedimentos> histImpedimentos = new List<IntegrationModels.HistoricoImpedimentos>();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getHistoricoImpedimentos(matricula);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        histImpedimentos = (List<IntegrationModels.HistoricoImpedimentos>) Json.deserialize(Json.serialize(responseBody.get('consulta_classificacao')), List<IntegrationModels.HistoricoImpedimentos>.class);
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return histImpedimentos; 
    }

    @AuraEnabled
    public static List<IntegrationModels.HistValClassificacoes> getHistValClassificacoes(String matricula){
        List<IntegrationModels.HistValClassificacoes> histValClassif = new List<IntegrationModels.HistValClassificacoes>();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getHistValClassificacoes(matricula);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        histValClassif = (List<IntegrationModels.HistValClassificacoes>) Json.deserialize(Json.serialize(responseBody.get('consulta_valores')), List<IntegrationModels.HistValClassificacoes>.class);
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return histValClassif; 
    }

    @AuraEnabled
    public static List<IntegrationModels.Vendedores> getVendedores(String matricula, String idContrato){
        List<IntegrationModels.Vendedores> vendedores = new List<IntegrationModels.Vendedores>();
        Try{
            if(matricula != null) {
                HTTPResponse responseAPI = IntegrationUtils.getVendedores(matricula, idContrato);
                if(responseAPI.getStatusCode() == 200){
                    if(responseAPI != null){
                        Map<String,Object> responseBody = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
                        vendedores = (List<IntegrationModels.Vendedores>) Json.deserialize(Json.serialize(responseBody.get('consulta_credito')), List<IntegrationModels.Vendedores>.class);
                    }
                }
            }            
        }catch(exception e){
            System.debug('Linha ' + e.getLineNumber() + 'Message ' + e.getMessage());         
        }  
        return vendedores; 
    }
}