@isTest
private class IntegrationESControllerTest {
    
    
    @testSetup
    public static void setup(){
        Account Cadastro = createAccount('teste', '8196667418', 'email@teste', '1747575');
    }
    
    @isTest static void getPropostaTest(){ 
        Test.startTest();
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"propostas":[{"id":2786441,"idModalidade":268,"modalidade":"ES-A 250 PLANO 1","grupoModalidade":"ROTATIVO","valorSolicitado":40000,"valorPrestacaoInicial":1531.22,"dataPrevistaCredito":"13/02/2023","dataPrevistaEnvioBB":null,"dataPrevistaPrimeiraPrestacao":"20/03/2023","dataPrevistaFimEmprestimo":"20/08/2025","qtdPrestacaoTaxaAdmin":null,"prazo":30,"prestacoesInciais":30,"valorPrestacaoTaxaAdmin":null,"valorCredito":32367.21,"dataSolicitacao":"09/02/2023","valorTaxaAdmin":80,"valorIOF":1132.65,"percentualIOF":2.993,"cancelavel":false}]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.GetPropostas(conta.Registration__c) != null);
        Test.stopTest(); 
    }
    
    
    
    @isTest static void getCobrancaTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"consulta_cobrancas":[{"cobranca":29834246,"tipoSuspen":"N","status":2,"dataVencimento":"20/01/2023","dataCompetencia":"01/01/2023","valorPrestacao":333.33,"tipoMovimento":"COBR PREST","numeroPrestacao":1,"remessas":[{"cobr":"FORH","dataCancel":null,"dataRealEnv":"03-01-2023","dataRetorno":"13-01-2023","descRetorno":"Pago","pago":"S","valCobrado":333.33}]},{"cobranca":30110310,"tipoSuspen":"N","status":2,"dataVencimento":"22/02/2023","dataCompetencia":"01/02/2023","valorPrestacao":333.33,"tipoMovimento":"COBR PREST","numeroPrestacao":2,"remessas":[{"cobr":"FORH","dataCancel":null,"dataRealEnv":"02-02-2023","dataRetorno":"14-02-2023","descRetorno":"Pago","pago":"S","valCobrado":333.33}]},{"cobranca":30263631,"tipoSuspen":"N","status":2,"dataVencimento":"20/03/2023","dataCompetencia":"01/03/2023","valorPrestacao":333.33,"tipoMovimento":"COBR PREST","numeroPrestacao":3,"remessas":[{"cobr":"FORH","dataCancel":null,"dataRealEnv":"02-03-2023","dataRetorno":"13-03-2023","descRetorno":"Pago","pago":"S","valCobrado":333.33}]},{"cobranca":30368710,"tipoSuspen":"N","status":9,"dataVencimento":"20/04/2023","dataCompetencia":"01/04/2023","valorPrestacao":333.33,"tipoMovimento":"COBR PREST","numeroPrestacao":4,"remessas":[{"cobr":"FORH","dataCancel":null,"dataRealEnv":"04-04-2023","dataRetorno":null,"descRetorno":null,"pago":"E","valCobrado":333.33}]}]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.GetCobranca('600','2766209') != null);
        Test.stopTest(); 
    }
    
    @isTest static void getDevolucoesTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"consulta_devolucao":[{"dtEvento":"06-01-21","valorOrigem":2051.42,"dtReal":"06-01-21","valorReal":2051.42,"status":"DEVOL","forma":null}]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getDevolucoes(conta.Registration__c,'2766209') != null);
        Test.stopTest(); 
    }
    
    @isTest static void getExtratoTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"digitoMatricula":"5","dataContrato":"13/06/2001","prestacaoAtual":147.64,"posicao":"Liquidado por recursos próprios","saldoDevedor":0,"taxaJuros":6,"taxaFQM":1,"taxaFl":0.5,"indiceCorrecao":"IGP-DI - ES","valorCredito":3931.79,"valorSolicitado":4000,"prazoRestante":34,"qtdPrestacoesIniciais":36,"encargos":[],"amortizacaoPrestacao":[{"dataCaixa":"01/08/2001","amortizacao":0,"prestacao":147.64,"total":147.64},{"dataCaixa":"01/07/2001","amortizacao":0,"prestacao":147.64,"total":147.64}],"lancamentos":[{"dataCaixa":"13/06/2001","dataEvento":"13/06/2001","tipoMovimento":"IMPLANTAÇÃO","correcao":0,"juros":0,"fqm":0,"fl":0,"valor":4000,"naturezaValor":"+","saldoDevedor":4000},{"dataCaixa":"30/06/2001","dataEvento":"30/06/2001","tipoMovimento":"ATUALIZAÇÃO MENSAL","correcao":25.5,"juros":10.94,"fqm":1.87,"fl":0.94,"valor":39.25,"naturezaValor":"+","saldoDevedor":4039.25},{"dataCaixa":"20/07/2001","dataEvento":"20/07/2001","tipoMovimento":"PRESTAÇÃO MENSAL","correcao":0,"juros":0,"fqm":0,"fl":0,"valor":147.64,"naturezaValor":"-","saldoDevedor":3891.61},{"dataCaixa":"31/07/2001","dataEvento":"31/07/2001","tipoMovimento":"ATUALIZAÇÃO MENSAL","correcao":18.5,"juros":19.86,"fqm":3.39,"fl":1.7,"valor":43.45,"naturezaValor":"+","saldoDevedor":3935.06},{"dataCaixa":"20/08/2001","dataEvento":"20/08/2001","tipoMovimento":"PRESTAÇÃO MENSAL","correcao":0,"juros":0,"fqm":0,"fl":0,"valor":147.64,"naturezaValor":"-","saldoDevedor":3787.42},{"dataCaixa":"24/08/2001","dataEvento":"24/08/2001","tipoMovimento":"ATUALIZAÇÃO MENSAL","correcao":42.75,"juros":15.16,"fqm":2.59,"fl":1.3,"valor":61.8,"naturezaValor":"+","saldoDevedor":3849.22},{"dataCaixa":"24/08/2001","dataEvento":"24/08/2001","tipoMovimento":"ANTECIPADA","correcao":0,"juros":0,"fqm":0,"fl":0,"valor":3849.22,"naturezaValor":"-","saldoDevedor":0}]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getExtrato(conta.Registration__c,'2766209') != null);
        Test.stopTest(); 
    }
    
    @isTest static void getModalidadesTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"modalidades":[{"id":191,"sigla":"ES 13º PL 1","descricao":"ES 13º PL 1","grupo":"ESDECTERC"}]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getModalidades(conta.Registration__c) != null);
        Test.stopTest(); 
    }
    
    @isTest static void getEmprestimosTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"emprestimos":[{"id":2590806,"idModalidade":242,"idModalidadeNova":264,"siglaModalidade":"ES-D 120 PLANO2","dataSaldoDevedor":"31/01/2023","valorSaldoDevedor":2147.33,"valorSaldoDevedorAtual":2149.18,"valorSaldoTaxaAdministracao":0,"qtdPrestacoesTaxaAdministracao":null,"valorPrestacao":29.27,"dataCredito":"14/02/2022","valorSolicitado":2235.08,"valorCredito":259.44,"prazo":120,"indicativoEmprestimoProposta":"EMP","indicativoAgendaLiquidez":"S","indicativoCheckLiquidez":null,"qtdPrestacoesIniciais":120,"qtdPrestacoesPagas":11,"qtdPrestacoesInadimplentes":0,"qtdPrestacoesInadimpConsecutivas":0,"qtdPrestacoesCobradas":12,"qtdPrestacoesRefinanciadas":null,"qtdPrestacoesRestantes":108,"qtdPrestacoesCobradasRefinanciadas":null,"dataRefinanciamento":null,"dataSolicitacaoEmprestimo":"10/02/2022","situacaoEmprestimo":null,"numContratoSistemaAnterior":null,"codigoGrupoModalidade":"ROTATIVO","percentualIOF":2.9914,"indicativoConcessaoAtiva":"S","carencia":false,"msgCarencia":null}]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getEmprestimos(conta.Registration__c) != null);
        Test.stopTest(); 
    }
    
    @isTest static void getRegistrationTest(){ 
        Test.startTest(); 
        Account conta = [SELECT Id FROM Account LIMIT 1];    
        System.assert(IntegrationESController.getRegistration(conta.Id) != null);
        Test.stopTest(); 
    }
    
    @isTest static void getImpedimentosTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"consulta_impedimento":[{"dtEvento":"28-02-2007","justificativa":"ALTERAÇÃO NA TAXA DE JUROS RETROATIVO A 01/01/2007"},{"dtEvento":"01-07-2007","justificativa":"DATA SALDO DEVEDOR DIFERENTE ÚLTIMO DIA DO MÊS"}]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getImpedimentos(conta.Registration__c) != null);
        Test.stopTest();
    }
    
    @isTest static void getRenegociacoesTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"propostas":[{"id_proposta_renegc":21,"modalidade":"ES RENEG PL1","valorPrestacao":990.18,"prestacoesRestantes":120,"taxaAtualFQM":1.2,"cancelavel":false,"numEmprestimo":1287092,"protocoloCadas":null,"protocoloCancel":null,"status":"IMPLA","dataRenegociacao":"30/11/2015","saldoDevedor":69233.67,"prestacaoAnt":1040.37,"dataImplantacao":"05/12/2015","qtdPrestRestante":97,"qtdPrestPagas":11,"qtdPrestCobradas":11}]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getRenegociacoes(conta.Registration__c) != null);
        Test.stopTest();
    }
    
    @isTest static void postPropostasTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',                                                            
                                                               '{"valorEmprestimo":2000,"valorPrestacao":10,"prazo":null,"valorPrestacaoInicial":null,"taxaAdministracao":null,"cpmf":null,"valorCreditado":null,"dataPrevisaoPrimeiraPrestacao":null,"dataPrevisaoUltimaPrestacao":null,"margemDisponivelApos":null,"valorLimiteDisponivelApos":null,"taxaAdministracaoQtdPrestacao":null,"taxaAdministracaoValorPrestacao":null,"percentualJuros":null,"percentualFQM":null,"percentualFL":null,"percentualIOF":null,"valorIOF":null,"valorIOFConcessao":null,"valorIOFDiferenca":null,"valorIOFImposto":null,"valorIOFAmortizacao":null,"valorTotalEmprestimoPreviLiquidado":null,"valorTotalEmprestimoBBLiquidado":null,"valorLiquido":null}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.postPropostas(conta.Registration__c,'{"modalidade":95,"dataPrevistaCredito":"2023-06-06","valorEmprestimo":2000,"valorPrestacao":10,"prazo":20,"idEmprestimosPreviImpactados":"2598364,2712641,2612135","idEmprestimosBBImpactados":""}','false') != null);
        Test.stopTest();
    }
    
    @isTest static void getAnotacaoTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"anotacoes":[{"descricaoAnotacao":"ENVIADO E.MAIL NESTA DATA: RECEBEMOS NESTA DATA PROPOSTA DE ES NO VALOR DE R$ 145.000,00, PRAZO DE 120 MESES. POR FAVOR, RETORNE ESTE E.MAIL COM SUA ANUÊNCIA QUANTO AO VALOR DA PRESTAÇÃO INICIAL DE R$ 1.982,92.","dataInclusao":"2014-12-02 00:00:00"}]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getAnotacao(conta.Registration__c) != null);
        Test.stopTest();
    }
    
    @isTest static void getRenegCondicTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"modalidade":"ES-D 240 PLANO 1","prazo":120,"prestacaoInicial":631.09,"taxaAtualFQM":1,"saldoDevedor":46997.69,"temMargemNovoEmprestimo":true}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getRenegCondic(conta.Registration__c,'2691494') != null);
        Test.stopTest();
    }
    
    @isTest static void getLimitesTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"limiteDisponivelNovoEmprestimo":152326.17,"limiteMinimoDispNovoEmprestimo":1000,"margemDisponivelNovoEmprestimo":2038.12,"saldoDevedorALiquidar":0,"saldoPrestacaoALiquidar":0,"totalSaldoPAS":0,"totalPrestacaoPAS":0,"prazoMaximo":120,"prestacaoMaxima":2038.12,"indiceReajustePrestacao":0.00831798,"dataSolicitacaoEmprestimo":"13/04/2023","valorAtrasoCFI":0,"valorCDP":0,"situacaoPrevi":"ATIVO","statusPlano":"NOR"}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getLimites(conta.Registration__c,'83248435', '83248435', '269', '2023-06-06') != null);
        Test.stopTest(); 
    }
    
    @isTest static void getSuspensaoPagamentosTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"consulta_suspensao":[{"idEmprestimo":7,"dataParcela":"01/01/2005","indSuspensao":"N"}]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getSuspensaoPagamentos(conta.Registration__c) != null);
        Test.stopTest();
    }
    
    @isTest static void getInformacoesAuditoriasTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"consulta_impedimento_audit":[{"dtEvento":"20-02-2014","justificativa":"INCONSISTÊNCIA ATUALIZAÇÃO PRIMEIRO DIA DO MÊS"}]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getInformacoesAuditorias(conta.Registration__c) != null);
        Test.stopTest();
    }

    @isTest static void getLqAmtInformacaoTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"projecaoSaldoDevedor":{"saldoDevedor":11072.9,"saldoTaxaAdministracao":0,"saldoDevedorParaLiquidacao":11072.9,"prestacaoAtual":333.33,"prazoRestante":40},"eventos":[{"id":1,"descricao":"LIQUIDAÇÃO"}],"amortizacao":{"opcoes":[{"id":1,"descricao":"Reduzir prazo","prazo":-615,"prestacao":333.33,"saldoDevedor":-27725289.03,"indiceReajustePrestacao":0.01116221}]},"formasPagamento":[{"id":1,"descricao":"Débito em Conta"},{"id":2,"descricao":"Boleto Bancário"}]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getLqAmtInformacao(conta.Registration__c,'2766209','2000','2023-06-06') != null);
        Test.stopTest();
    }
    
    @isTest static void getDadosAssociadosTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"nome":"JULIANA DE SOUZA VIEIRA","situacaoPrevi":"ATIVO","status":"NOR","codigoEmpresa":2,"dataAssinaturaContrato":"20/07/2015","plano":2,"siglaRemessa":"FPA","valorMargemTotal":3164.66,"valorMargemDisponivel":3164.66,"valorLimiteTotal":124079.13,"valorLimiteDisponivel":124079.13,"valorTotalPrestacao":0,"indicativoCobrancaPrevista":"PREVIS","valorTotalSaldo":0,"indicativoAuditoria":"N","indicativoAnotacao":"N","indicativoImpedimento":"N","indicativoCondicao":"N","indicativoInadimplencia":"N","textoAlerta":null,"cpf":12248344708,"codigoAgencia":"5761-4","numeroContaCorrente":"6001835-6","incapazOuRepLegal":false,"msgIncapazOuRepLegal":null,"emprestimosConcedidos":[]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getDadosAssociados(conta.Registration__c) != null);
        Test.stopTest();
    }
    
    @isTest static void getEmprestimosLiquidadosTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"emprestimosLiquidados":[{"id":997178,"siglaModalidade":"ES FINIMOB 110 SÉRIE 12 <= 59","dataSaldoDevedor":"05/07/2018","valorPrestacao":588.3,"dataCredito":"24/04/2012","valorSolicitado":27000,"valorCredito":26173.26,"prazo":96,"qtdPrestacoesIniciais":96,"qtdPrestacoesPagas":71,"qtdPrestacoesCobradas":72,"qtdPrestacoesRestantes":24,"dataSolicitacaoEmprestimo":"20/04/2012","codigoGrupoModalidade":"ESFINIMOB","percentualIOF":2.482,"siglaMovimento":"COBR LIQ RECUR PRÓPR","dtVencto":"05/07/2018","dtCancel":null,"valorCobrado":5704.23,"valorPag":5704.23,"formaLiqAmort":"DCO"}]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getEmprestimosLiquidados(conta.Registration__c) != null);
        Test.stopTest();
    }
    
    @isTest static void getOpcaoPagamentoTest(){ 
        Test.startTest(); 
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                               'Complete',
                                                               '{"opcoes":[{"valorEmprestimo":0,"valorPrestacao":0,"prazo":120}]}',
                                                               null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.getOpcaoPagamento(conta.Registration__c,'249','2023-06-06','','','') != null);
        Test.stopTest();
    }
    
        @isTest static void carregandoTabPropostaTest(){ 
        Test.startTest(); 
            
        Account conta = [SELECT Id, Registration__c FROM Account LIMIT 1];  
        System.assert(IntegrationESController.carregandoTabProposta(conta.Registration__c,'[{"agenciaCreditada":"1402-8","cancelavel":false,"contaCreditada":"600-9","dataPrevistaCredito":"27/04/2007","dataPrevistaFimEmprestimo":"20/06/2011","dataPrevistaPrimeiraPrestacao":"20/05/2007","dataSolicitacao":"23/04/2007","ESLiquidado":27238.19,"grupoModalidade":"ROTATIVO","id":487235,"idModalidade":13,"indOrigemPropos":"INTERNET","modalidade":"ES ROTATIVO SÉRIE 12 PL1","posicaoES":"Liquidado por renovação","prazo":50,"prestacoesInciais":50,"qtdPrestacaoTaxaAdmin":"0","situacaoProposta":"CRED","valDivFinancImob":0,"valDivPrevi":0,"valLiquido":2576.48,"valorCredito":2576.48,"valorIOF":35.33,"valorPrestacaoInicial":765.38,"valorPrestacaoTaxaAdmin":"0","valorSolicitado":30000,"valorTaxaAdmin":150,"verbasPAS":0},{"agenciaCreditada":"1402-8","cancelavel":false,"contaCreditada":"600-9","dataPrevistaCredito":"23/08/2007","dataPrevistaFimEmprestimo":"20/10/2011","dataPrevistaPrimeiraPrestacao":"20/09/2007","dataSolicitacao":"21/08/2007","ESLiquidado":27978.11,"grupoModalidade":"ROTATIVO","id":525682,"idModalidade":13,"indOrigemPropos":"INTERNET","modalidade":"ES ROTATIVO SÉRIE 12 PL1","posicaoES":"Liquidado por renovação","prazo":50,"prestacoesInciais":50,"qtdPrestacaoTaxaAdmin":"0","situacaoProposta":"CRED","valDivFinancImob":0,"valDivPrevi":0,"valLiquido":1845.93,"valorCredito":1845.93,"valorIOF":25.96,"valorPrestacaoInicial":765.38,"valorPrestacaoTaxaAdmin":"0","valorSolicitado":30000,"valorTaxaAdmin":150,"verbasPAS":0},{"agenciaCreditada":"1402-8","cancelavel":false,"contaCreditada":"600-9","dataPrevistaCredito":"24/12/2007","dataPrevistaFimEmprestimo":"20/12/2012","dataPrevistaPrimeiraPrestacao":"20/01/2008","dataSolicitacao":"20/12/2007","ESLiquidado":28083.55,"grupoModalidade":"ROTATIVO","id":572308,"idModalidade":23,"indOrigemPropos":"INTERNET","modalidade":"ES ROTATIVO 35 SERIE 12 PL1","percentualIOF":1.3147,"posicaoES":"Liquidado por renovação","prazo":60,"prestacoesInciais":60,"qtdPrestacaoTaxaAdmin":"0","situacaoProposta":"CRED","valDivFinancImob":0,"valDivPrevi":0,"valLiquido":6650.52,"valorCredito":6650.52,"valorIOF":90.93,"valorPrestacaoInicial":760.98,"valorPrestacaoTaxaAdmin":"0","valorSolicitado":35000,"valorTaxaAdmin":175,"verbasPAS":0},{"agenciaCreditada":"1402-8","cancelavel":false,"contaCreditada":"600-9","dataPrevistaCredito":"25/04/2008","dataPrevistaFimEmprestimo":"20/04/2013","dataPrevistaPrimeiraPrestacao":"20/05/2008","dataSolicitacao":"23/04/2008","ESLiquidado":33633.39,"grupoModalidade":"ROTATIVO","id":601102,"idModalidade":23,"indOrigemPropos":"INTERNET","modalidade":"ES ROTATIVO 35 SERIE 12 PL1","percentualIOF":2.6262,"posicaoES":"Liquidado por renovação","prazo":60,"prestacoesInciais":60,"qtdPrestacaoTaxaAdmin":"0","situacaoProposta":"CRED","valDivFinancImob":0,"valDivPrevi":0,"valLiquido":1150.53,"valorCredito":1150.53,"valorIOF":41.08,"valorPrestacaoInicial":760.98,"valorPrestacaoTaxaAdmin":"0","valorSolicitado":35000,"valorTaxaAdmin":175,"verbasPAS":0},{"agenciaCreditada":"1402-8","cancelavel":false,"contaCreditada":"600-9","dataPrevistaCredito":"24/09/2008","dataPrevistaFimEmprestimo":"20/09/2013","dataPrevistaPrimeiraPrestacao":"20/10/2008","dataSolicitacao":"22/09/2008","ESLiquidado":33387.05,"grupoModalidade":"ROTATIVO","id":2712641,"idModalidade":24,"indOrigemPropos":"INTERNET","modalidade":"ES ROTATIVO 35 SERIE 10 PL1","percentualIOF":2.723,"posicaoES":"Liquidado por renovação","prazo":60,"prestacoesInciais":50,"situacaoProposta":"CRED","valDivFinancImob":0,"valDivPrevi":0,"valLiquido":1370.44,"valorCredito":1370.44,"valorIOF":172.51,"valorPrestacaoInicial":855.23,"valorSolicitado":35000,"valorTaxaAdmin":70,"verbasPAS":0}]')  != null);
        Test.stopTest();
    }

    @isTest static void  getDataEntradaTest(){ System.assert(IntegrationESController.getDataEntrada() != null);}
    
    private static account createAccount(string name, string phone, String email, String registration){
        Account Cadastro = new Account();
        Cadastro.Name = name;
        Cadastro.phone = phone;
        Cadastro.Registration__c = registration;
        Cadastro.Income_Tax_Statement__c = 'Postal';
        Cadastro.Info_Previ__c = 'Email';
        Cadastro.Other_Institutional_Info__c = 'Email';
        Cadastro.Card_Benefits_Club__c = 'Email';
        Cadastro.Other_Promotional_Info__c = 'Email';
        
        insert Cadastro;
        return Cadastro;        
    }
    
    @isTest
    static void returnTabPropostasTest(){
        IntegrationESController.returnTabPropostas ir = new IntegrationESController.returnTabPropostas();
        ir.id = '';
        ir.modalidade = '629';
        ir.valorSolicitado = 200;
        ir.dataPrevistaCredito = '';
        ir.situacaoProposta = '';
        ir.dataSolicitacao = '';
        ir.valorTaxaAdmin = 110;
        ir.valorIOF = 50;
        ir.valFQM = 10;
        ir.valorCredito = 500;
        ir.protocoloCadas = '';
        ir.protocoloCancel = '';
        ir.ESLiquidado= 10;
        ir.verbasPAS= 10;
        ir.valDivFinancImob= 10;
        ir.valDivPrevi= 10;
        ir.agenciaCreditada= '';
        ir.contaCreditada= '';
        ir.indOrigemPropos= '';
        ir.dataPrevistaFimEmprestimo= '';
        ir.dataSaldoDevedor= '';
        ir.valorSaldoDevedorAtual= '';
        ir.indicativoEmprestimoProposta= '';
        ir.qtdPrestacoesInadimpConsecutivas= '';
        ir.erro= false;
    }
    
        @isTest
    static void bodyPropostaTest(){
        IntegrationESController.bodyProposta bdy = new IntegrationESController.bodyProposta();
        bdy.modalidade = '';
        bdy.dataPrevistaCredito = '';
        bdy.valorEmprestimo = '';
        bdy.valorPrestacao = '';
        bdy.prazo = '';
        bdy.idEmprestimosPreviImpactados = '';
        bdy.idEmprestimosBBImpactados = '';
    }
}