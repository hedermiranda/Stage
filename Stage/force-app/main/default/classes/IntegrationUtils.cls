public with sharing class IntegrationUtils {
    
    public static inforCredentials__mdt dadosCadastrais =  inforCredentials__mdt.getInstance('infor');
    
    
    public static Map<String,Object> getEmail(String matricula) {
        String endpoint = 'https://apigatewayhmg.previ.com.br/previ/hmg/dados-cadastrais-participante/v1/cadastro/' + matricula + '/email';
        Map<String,Object> mapResponse = !Test.isRunningTest() ? IntegrationServices.sendGetRequest(endpoint) : testAuxiliary;
        return IntegrationServices.sendGetRequest(endpoint);
    }
    
    public static Map<String,Object> getCadastro(String matricula) {
        String endpoint = 'https://apigatewayhmg.previ.com.br/previ/hmg/dados-cadastrais-participante/v1/cadastro/' + matricula;
        Map<String,Object> mapResponse = !Test.isRunningTest() ? IntegrationServices.sendGetRequest(endpoint) : testAuxiliary;
        return IntegrationServices.sendGetRequest(endpoint);
    }
    
    public static Map<String,Object> getEndereco(String matricula) {
        String endpoint = 'https://apigatewayhmg.previ.com.br/previ/hmg/dados-cadastrais-participante/v1/cadastro/' + matricula + '/enderecos';
        Map<String,Object> mapResponse = !Test.isRunningTest() ? IntegrationServices.sendGetRequest(endpoint) : testAuxiliary;
        return IntegrationServices.sendGetRequest(endpoint);
    }
    
    public static Map<String,Object> getOpcoesCorrespondencia(String matricula) {
        String endpoint = 'https://apigatewayhmg.previ.com.br/previ/hmg/dados-cadastrais-participante/v1/cadastro/' + matricula + '/opcoes-correspondencia';
        Map<String,Object> mapResponse = !Test.isRunningTest() ? IntegrationServices.sendGetRequest(endpoint) : testAuxiliary;
        return IntegrationServices.sendGetRequest(endpoint);
    }
    
    public static Map<String,Object> getPPE(String cpf) {
        String endpoint = 'https://apigatewayhmg.previ.com.br/previ/hmg/dados-cadastrais-participante/v1/cadastro/' + cpf + '/historicos-ppe';
        Map<String,Object> mapResponse = !Test.isRunningTest() ? IntegrationServices.sendGetRequest(endpoint) : testAuxiliary;
        return IntegrationServices.sendGetRequest(endpoint);
    }
    
    public static Map<String,Object> getTelefones(String matricula) {
        String endpoint = 'https://apigatewayhmg.previ.com.br/previ/hmg/dados-cadastrais-participante/v1/cadastro/' + matricula + '/telefones';
        //Map<String,Object> mapResponse = !Test.isRunningTest() ? IntegrationServices.sendGetRequest(endpoint) : testAuxiliary;
        return IntegrationServices.sendGetRequest(endpoint);
    }
    
    public static Map<String,Object> getPaises() {
        String endpoint = 'https://apigatewayhmg.previ.com.br/previ/hmg/dados-cadastrais-participante/v1/cadastro/' + '/paises';
        //Map<String,Object> mapResponse = !Test.isRunningTest() ? IntegrationServices.sendGetRequest(endpoint) : testAuxiliary;
        return IntegrationServices.sendGetRequest(endpoint);
    }
    
    public static Map<String,Object> getMunicipiosBrasileiros() {
        String endpoint = 'https://apigatewayhmg.previ.com.br/previ/hmg/dados-cadastrais-participante/v1/cadastro/' + '/municipios-brasileiros';
        Map<String,Object> mapResponse = !Test.isRunningTest() ? IntegrationServices.sendGetRequest(endpoint) : testAuxiliary;
        return IntegrationServices.sendGetRequest(endpoint);
    }
    
    public static HTTPResponse postEmail(String registration, String body) {
        return IntegrationServices.syncCallout(
            'Email',
            new List<String> {registration,'email'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            body);
    }
    
    public static HTTPResponse putTelefone(String registration, String body) {
        return IntegrationServices.syncCallout(
            'Telefone',
            new List<String> {registration,'telefones'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            body);
    }
    
    public static HTTPResponse putEndereco(String registration, String body) {
        system.debug('registration ' + registration + ' body ' + body);
        return IntegrationServices.syncCallout(
            'Endereco',
            new List<String> {registration,'enderecos'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            body); 
    }
    
    
    public static HTTPResponse postOpcaoCorrespondencia(String registration, String body) {
        return IntegrationServices.syncCallout(
            'OpcoesCorrespondencia',
            new List<String> {registration,'opcoes-correspondencia'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            body); 
    }
    
    public static HTTPResponse getPatrocinador(String matricula) {
        return IntegrationServices.syncCallout(
            'HostCadastro',
            new List<String> {'cadastro',matricula,'previpatrocinador'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            null); 
    }
    
    public static HTTPResponse getHistSituacoesFuncionais(String matricula) {
        return IntegrationServices.syncCallout(
            'HostCadastro',
            new List<String> {'cadastro',matricula,'historicos/situacoesfuncionais'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            null); 
    }
    
    public static HTTPResponse getHistFuncoes(String matricula) {
        return IntegrationServices.syncCallout(
            'HostCadastro',
            new List<String> {'cadastro',matricula,'historicos/funcoes'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            null); 
    }
    
    public static HTTPResponse getDadosBancarios(String matricula) {
        return IntegrationServices.syncCallout(
            'HostCadastro',
            new List<String> {'cadastro',matricula,'dados-bancarios'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            null); 
    }
    
    /*public static HTTPResponse postDadosBancarios(String matricula, String body) {
    return IntegrationServices.syncCallout(
    'HostCadastro',
    new List<String> {'cadastro',matricula,'dados-bancarios'},
    null,
    new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
    body); 
    }*/
    
    public static HTTPResponse getBeneficiarios(String matricula) {
        return IntegrationServices.syncCallout(
            'HostCadastro',
            new List<String> {'beneficiarios',matricula},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            null); 
    }
    
    public static HTTPResponse getExDependentes(String matricula) {
        return IntegrationServices.syncCallout(
            'HostCadastro',
            new List<String> {matricula,'ex-dependentes'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            null); 
    }
    
    public static HTTPResponse getLicencaInteresses(String matricula) { 
        return IntegrationServices.syncCallout(
            'HostCadastro',
            new List<String> {'cadastro',matricula,'historicos/licencasinteresses'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            null); 
    }
    
    public static HTTPResponse getRepresentantesLegais(String matricula) { 
        return IntegrationServices.syncCallout(
            'HostCadastro',
            new List<String> {'cadastro',matricula,'historicos/representantes-legais'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            null); 
    }
    
    public static HTTPResponse getHistEmail(String matricula) { 
        return IntegrationServices.syncCallout(
            'HostCadastro',
            new List<String> {'cadastro',matricula,'historicos/emails'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            null); 
    }
    
    public static HTTPResponse getHistEnderecos(String matricula) { 
        return IntegrationServices.syncCallout(
            'HostCadastro',
            new List<String> {'cadastro',matricula,'historicos/enderecos'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            null); 
    }
    
    public static HTTPResponse getHistTelefones(String matricula) { 
        return IntegrationServices.syncCallout(
            'HostCadastro',
            new List<String> {'cadastro',matricula,'historicos/telefones'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','x-ibm-client-secret' => dadosCadastrais.ClientSecret__c, 'x-ibm-client-id' => dadosCadastrais.ClientId__c },
            null); 
    }
    
    public static HTTPResponse getCobrancas(String matricula, String idEmprestimo) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula,'emprestimos',idEmprestimo,'cobrancas'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getDevolucoes(String matricula, String idEmprestimo) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula,'emprestimos',idEmprestimo,'devolucoes'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getPropostas(String matricula) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula,'propostas'},
            new Map<String,String> { 'situacaoProposta' => 'TODAS'},
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getExtrato(String matricula, String idEmprestimo) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula,'emprestimos',idEmprestimo,'extrato'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getEmprestimosLiquidados(String matricula) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula,'emprestimos-liquidados'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getModalidades(String matricula) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula,'modalidades'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getEmprestimos(String matricula) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula,'emprestimos'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getImpedimentos(String matricula) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula,'impedimentos'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getLimites(String matricula, String idEmprestimosPrevi, String idEmprestimosBB, String modalidade, String dataPrevistaCredito) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula,'limites'},
            new Map<String,String> { 'idEmprestimosPrevi' => idEmprestimosPrevi,'idEmprestimosBB' => idEmprestimosBB, 'modalidade' => modalidade, 'dataPrevistaCredito' => dataPrevistaCredito},
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getRenegociacoes(String matricula,String situacao) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula,'renegociacoes'},
            new Map<String,String> { 'situacaoReneg' => situacao},
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse postPropostas(String registration, String body, String gravar) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesPost',
            new List<String> {registration,'propostas'},
            new Map<String,String> { 'gravar' => gravar},
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            body); 
    }
    
    public static HTTPResponse getAnotacao(String matricula) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula,'anotacoes'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getRenegCondic(String matricula, String idEmprestimo) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula,'emprestimos',idEmprestimo,'renegociacoes/condicoes'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getSuspensaoPagamentos(String matricula) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula,'emprestimos/suspensao-pagamentos/parcelas'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getInformacoesAuditorias(String matricula) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula,'informacoes-auditoria'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getLqAmtInformacao(String matricula, String idEmprestimo, String valorAmortizacao, String dataEvento) {
        if(valorAmortizacao == null || valorAmortizacao == ''){
            return IntegrationServices.syncCallout(
                'EmprestimoSimplesGet',
                new List<String> {matricula,'emprestimos',idEmprestimo,'amortizacoes-liquidacoes/informacoes'},
                new Map<String,String> { 'dataEvento' => dataEvento },
                new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
                null);
        }else{
            return IntegrationServices.syncCallout(
                'EmprestimoSimplesGet',
                new List<String> {matricula,'emprestimos',idEmprestimo,'amortizacoes-liquidacoes/informacoes'},
                new Map<String,String> { 'valorAmortizacao' => valorAmortizacao, 'dataEvento' => dataEvento },
                new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
                null);
        }
        
    }
    
    public static HTTPResponse getDadosAssociados(String matricula) {
        return IntegrationServices.syncCallout(
            'EmprestimoSimplesGet',
            new List<String> {matricula},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getOpcaoPagamento(String matricula, String modalidade, String dataPrevistaCredito, String valorEmprestimo, String prazo, String valorPrestacao) {
        if(prazo == null || prazo == ''){
            return IntegrationServices.syncCallout(
                'EmprestimoSimplesGet',
                new List<String> {matricula,'modalidades',modalidade,'opcoes-pagamento'},
                new Map<String,String> { 'valorEmprestimo' => valorEmprestimo, 'dataPrevistaCredito' => dataPrevistaCredito},
                new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c, 'valorPrestacao' => valorPrestacao },
                null);
        }else{
            return IntegrationServices.syncCallout(
                'EmprestimoSimplesGet',
                new List<String> {matricula,'modalidades',modalidade,'opcoes-pagamento'},
                new Map<String,String> { 'prazo' => prazo, 'dataPrevistaCredito' => dataPrevistaCredito},
                new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c,'valorPrestacao' => valorPrestacao },
                null);   
        }
    }
    
    public static HTTPResponse getProtocolos(String matricula, String idOrigemMatricula ) {
        return IntegrationServices.syncCallout(
            'Protocolo',
            new List<String> {'protocolos?idOrigemMatricula=' + idOrigemMatricula + '&matricula=' + matricula},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    //Start - Pensoes
    public static HTTPResponse getPensoes(String matricula) {
        return IntegrationServices.syncCallout(
            'PensoesGet',
            new List<String> {'participantes', matricula, 'pensoes-morte'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getHistoricoBilhetes(String matricula) {
        return IntegrationServices.syncCallout(
            'PensoesGet',
            new List<String> {'participantes', matricula, 'historicos-bilhetes'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getHistoricoBases(String matricula) {
        return IntegrationServices.syncCallout(
            'PensoesGet',
            new List<String> {'participantes', matricula, 'historicos-bases?tipo=<string>'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getGruposFamiliar(String matricula) {
        return IntegrationServices.syncCallout(
            'PensoesGet',
            new List<String> {'participantes', matricula, 'grupos-familiar'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getPensionistas(String matricula, String grupo) {
        return IntegrationServices.syncCallout(
            'PensoesGet',
            new List<String> {'participantes', matricula, 'gruposfamiliares', grupo, 'pensionistas?tipo=<string>'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getRepresentanteLegal(String matricula, String grupo) {
        return IntegrationServices.syncCallout(
            'PensoesGet',
            new List<String> {'participantes', matricula, 'gruposfamiliares', grupo, 'representantes-legal'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getHistoricos(String matricula, String grupo, String pensionista) {
        return IntegrationServices.syncCallout(
            'PensoesGet',
            new List<String> {'participantes', matricula, 'gruposfamiliares', grupo, 'pensionistas', pensionista, 'historicos'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getComplementoPensao(String matricula){
        return IntegrationServices.syncCallout(
            'PensoesGet',
            new List<String> {'participantes', matricula, 'complemento-pensao'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getPendenciaDocumentos(String matricula, String grupo, String pensionista){
        return IntegrationServices.syncCallout(
            'PensoesGet',
            new List<String> {'participantes', matricula, 'gruposfamiliares', grupo, 'pensionistas', pensionista, 'pendencias'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getRecadastramento(String matricula, String ano){
        return IntegrationServices.syncCallout(
            'ManutencaoAssistGet',
            new List<String> {ano, 'recadastramentos', matricula},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getConcessaoInssPrisma(String matricula){
        return IntegrationServices.syncCallout(
            'AposentadoriaGet',
            new List<String> {'participantes', matricula, 'habilitacoes-inss'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getAdiantamentos(String matricula){
        return IntegrationServices.syncCallout(
            'AposentadoriaGet',
            new List<String> {'participantes', matricula, 'adiantamentos'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    //End - Pensoes
    
    /* Autoatendimento - Matriculas */
    public static HTTPResponse calloutMatriculas(String cpf){
        
        return IntegrationServices.syncCallout(
            'UrlBaseGet',
            new List<String> {'autoatendimento/v2',cpf, 'informacao-associado'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c},
            null);     
    }

    //Start - Senha
    public static HTTPResponse getHistoricosSenha(String matricula){
        return IntegrationServices.syncCallout(
            'SenhaGet',
            new List<String> {matricula, 'senhas', 'historicos'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getSolicitacoesTroca(String matricula){
        return IntegrationServices.syncCallout(
            'SenhaGet',
            new List<String> {matricula, 'senhas', 'solicitacoes-trocas'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    //End - Senha

    public static HTTPResponse getContratos(String matricula) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'contratos'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getDadosFin(String matricula) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'dados-financiamentos'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getDevedorSolidario(String matricula, String idContrato) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'contratos', idContrato, 'devedores-solidarios'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getLiquidacoes(String matricula, String idContrato) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'contratos', idContrato, 'liquidacoes'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getImpedimentosFI(String matricula, String idContrato) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'contratos', idContrato, 'impedimentos'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getAnotacoesFI(String matricula, String idContrato) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'contratos', idContrato, 'anotacoes'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    public static HTTPResponse getCondominos(String matricula, String idContrato) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'contratos', idContrato, 'condominos'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getSeguros(String matricula, String idContrato) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'contratos', idContrato, 'seguros'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getCobrancasFI(String matricula, String idContrato, String filter) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'contratos', idContrato, 'cobrancas?filtroPrestacao='+filter},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getExtratoFI(String matricula, String idContrato) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'contratos', idContrato, 'extrato'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getAtrasos(String matricula, String idContrato) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'contratos', idContrato, 'atrasos'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getDevolucoesFI(String matricula, String idContrato) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'contratos', idContrato, 'devolucoes'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getVendedores(String matricula, String idContrato) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'contratos', idContrato, 'vendedores'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getCreditoSinal(String matricula, String idContrato) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'contratos', idContrato, 'credito-sinal'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getFgts(String matricula, String idContrato) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'contratos', idContrato, 'fgts'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getCarta(String matricula) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'carta'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getHistoricoImpedimentos(String matricula) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'impedimentos'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }

    public static HTTPResponse getHistValClassificacoes(String matricula) {
        return IntegrationServices.syncCallout(
            'FinImob',
            new List<String> {'mutuarios', matricula, 'historicos-valores-classificacacoes'},
            null,
            new Map<String,String> { 'Content-Type' => 'application/json','X-IBM-Client-Secret' => dadosCadastrais.ClientSecret__c, 'X-IBM-Client-Id' => dadosCadastrais.ClientId__c },
            null);
    }
    
    @testVisible
    private static Map<String,Object> testAuxiliary;
}