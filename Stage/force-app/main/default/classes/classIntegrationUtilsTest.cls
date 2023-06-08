@isTest
private class classIntegrationUtilsTest {
    
    @isTest
   static void getEmailTest(){
        IntegrationUtils.testAuxiliary = new Map<String,Object>{'statusCode' => '200', 'body' => 'd'};
        IntegrationUtils.getEmail('600');
    }
    
    @isTest
    static void getCadastroTest(){
        IntegrationUtils.testAuxiliary = new Map<String,Object>{'statusCode' => '200', 'body' => 'd'};
        IntegrationUtils.getCadastro('600');
    }
    
    @isTest
    static void getEnderecoTest(){
        IntegrationUtils.testAuxiliary = new Map<String,Object>{'statusCode' => '200', 'body' => 'd'};
        IntegrationUtils.getEndereco('600');
    }
    
    @isTest
    static void getOpcoesCorrespondenciaTest(){
        IntegrationUtils.testAuxiliary = new Map<String,Object>{'statusCode' => '200', 'body' => 'd'};
        IntegrationUtils.getOpcoesCorrespondencia('600');
    }
    @isTest
    static void getPPETest(){
        IntegrationUtils.testAuxiliary = new Map<String,Object>{'statusCode' => '200', 'body' => 'd'};
        IntegrationUtils.getPPE('600');
    }
    @isTest
    static void getTelefonesTest(){
        IntegrationUtils.testAuxiliary = new Map<String,Object>{'statusCode' => '200', 'body' => 'd'};
        IntegrationUtils.getTelefones('600');
    }
    @isTest
    static void getPaisesTest(){
        IntegrationUtils.testAuxiliary = new Map<String,Object>{'statusCode' => '200', 'body' => 'd'};
        IntegrationUtils.getPaises();
    }
    @isTest
    static void getMunicipiosBrasileirosTest(){
        IntegrationUtils.testAuxiliary = new Map<String,Object>{'statusCode' => '200', 'body' => 'd'};
            IntegrationUtils.getMunicipiosBrasileiros();
    }
    @isTest
    static void PutEnderecoTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.putEndereco('600','{"atualizar":{"logradouro":"RUA VEREADOR DEOCLECIANO RAMOS","numero":351,"complemento":"SALA 01","bairro":"SUICA","municipio":"Calgary","uf":"SE","cep":"49050750","pais":"Brasil"},"idMatricula":12345678}') != null);
    }
    
    @isTest
    static void PostEmailTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.postEmail('600','{"email":"leonardo3@1235testgmail.com"}') != null);
    }
    
    @isTest
    static void PutTelefoneTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.putTelefone('600','{"telefone":{"ddd1":"et reprehenderit sunt","ddi1":"commodo in voluptate","ddd2":"labore occaecat do a","ddi2":"minim id sed ex","ddd3":"ut","ddi3":"dolore in velit","ddd4":"aute cupidatat nostrud in mollit","ddi4":"culpa pariatur sed cillum","telefone1":"Lorem mollit","telefone2":"ut voluptate","telefone3":"occaecat aliqua sed do","ramal1":"cillum nisi aute et","ramal2":"consectetur officia incididunt aliqua","ramal3":"sint exercitation eu","fax":"laboris nisi"}}') != null);
    }
    
    @isTest
    static void PostOpcaoCorrespondenciaTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.postOpcaoCorrespondencia('600','{"opcaoCorrespondencia":{"idCorrespondencia":3,"correspondencia":"InfPREVI","envioPostal":"N","envioEmail":"N","envioCelular":"D"}}') != null);
    }
    
    @isTest
    static void getCobrancasTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getCobrancas('600','2766209 ') != null);
    }
    
    @isTest
    static void getDevolucoesTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getDevolucoes('7499010','341826') != null);
    }
    
    @isTest
    static void getExtratoTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getExtrato('521','1') != null);
    }
    
    @isTest
    static void getModalidadesTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getModalidades('6324739') != null);
    }
    
    @isTest
    static void getRenegCondicTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getRenegCondic('4711240','2691494') != null);
    }
    
    @isTest
    static void getEmprestimosTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getEmprestimos('6782051') != null);
    }
    
    @isTest
    static void getImpedimentosTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getImpedimentos('600') != null);
    }
    
    @isTest
    static void getRenegociacoesTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getRenegociacoes('9977770','TODOS') != null);
    }
    
    @isTest
    static void getPropostasTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getPropostas('600') != null);
    }
    
    @isTest
    static void postPropostasTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.postPropostas('1747575','{"modalidade":95,"dataPrevistaCredito":"25/01/2014","valorEmprestimo":2000,"valorPrestacao":10,"prazo":20}','false') != null);
    }
    
    @isTest
    static void getAnotacaoTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getAnotacao('1022125') != null);
    }
    
    @isTest
    static void getSuspensaoPagamentosTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getSuspensaoPagamentos('1022125') != null);
    }
    @isTest
    static void getInformacoesAuditoriasTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getInformacoesAuditorias('6782051') != null);
    }
    @isTest
    static void getLqAmtInformacaoTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getLqAmtInformacao('600','2766209','','01/05/2023') != null);
    }
    
    @isTest
    static void getDadosAssociadosTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getDadosAssociados('6001835') != null);
    }
    
    @isTest
    static void getOpcaoPagamentoTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getOpcaoPagamento('6782051','249','31/05/2023','','120','') != null);
        //String matricula, String modalidade, String dataPrevistaCredito, String valorEmprestimo, String prazo, String valorPrestacao
    }
    
    @isTest
    static void calloutMatriculasTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.calloutMatriculas('2615061534') != null);
    }
    @isTest
    static void infoCadastroTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getPatrocinador('600') != null);
        System.assert(IntegrationUtils.getHistSituacoesFuncionais('600') != null);
        System.assert(IntegrationUtils.getHistFuncoes('600') != null);
        System.assert(IntegrationUtils.getDadosBancarios('600') != null);
        System.assert(IntegrationUtils.getBeneficiarios('600') != null);
        System.assert(IntegrationUtils.getExDependentes('600') != null);
        System.assert(IntegrationUtils.getEmprestimosLiquidados('600') != null);
    }
    
    @isTest
    static void pensoesTest(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationUtils.getPensoes('1022125') != null);
        System.assert(IntegrationUtils.getHistoricoBilhetes('1022125') != null);
        System.assert(IntegrationUtils.getHistoricoBases('1022125') != null);
        System.assert(IntegrationUtils.getGruposFamiliar('1022125') != null);
        System.assert(IntegrationUtils.getPensionistas('1022125', '1') != null);
        System.assert(IntegrationUtils.getRepresentanteLegal('1022125', '1') != null);
        System.assert(IntegrationUtils.getHistoricos('1022125', '1', '102089') != null);
        System.assert(IntegrationUtils.getComplementoPensao('1022125') != null);
        System.assert(IntegrationUtils.getPendenciaDocumentos('1022125', '1', '102089') != null);
        System.assert(IntegrationUtils.getRecadastramento('1022125', '2021') != null);
        System.assert(IntegrationUtils.getConcessaoInssPrisma('1022125') != null);
        System.assert(IntegrationUtils.getAdiantamentos('1022125') != null);
   }
}