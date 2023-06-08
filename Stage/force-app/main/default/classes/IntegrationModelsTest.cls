@isTest
public class IntegrationModelsTest {
    @isTest
    static void getCadastrosTest(){
        IntegrationModels.GetCadastros getCadastros = new IntegrationModels.GetCadastros();
        getCadastros.nome = 'nameTeste'; 
        getCadastros.dataNascimento = 'Teste';
        getCadastros.sexo = 'Teste';
        getCadastros.tipoCliente = 'Teste';
        getCadastros.matricula = 1;
        getCadastros.codPlano = 1;
        getCadastros.codSituacaoEmpresa = 1;
        getCadastros.situacaoEmpresa = 'Teste';
        getCadastros.situacaoPrevi = 'Teste'; 
        getCadastros.statusPrevi = 'Teste';
        getCadastros.codEmpresa = 1;
        getCadastros.nomeEmpresa = 'Teste';
        getCadastros.numSeqPrevi = 1;
        getCadastros.email = 'Teste';
        getCadastros.cpf = 'Teste';       
        getCadastros.estadoCivil = 'Teste';
        getCadastros.idEstadoCivil = 1;
        getCadastros.tipo = 'Teste';
        getCadastros.codigoNumero = 'Teste';
        getCadastros.emissao = 'Teste';
        getCadastros.orgaoEmissor = 'Teste';
        getCadastros.pisPasep = 'Teste';
        getCadastros.pai = 'Teste';
        getCadastros.mae = 'Teste';
        getCadastros.nacionalidade = 'Teste';
        getCadastros.naturalidade = 'Teste';
        getCadastros.capacCivil = 1;
        getCadastros.descCapacCivil = 'Teste';
        getCadastros.erro = null;
        
        IntegrationModels.CadastroResponse cadastroResponse = new IntegrationModels.CadastroResponse();
        cadastroResponse.cadastro = getCadastros;
        cadastroResponse.erro = null;
    }
    
    @isTest
    static void endereco(){
        IntegrationModels.Endereco endereco = new IntegrationModels.Endereco();
        endereco.endereco = 'Teste';
        endereco.cep = 'Teste';
        endereco.bairro = 'Teste';
        endereco.idPais = 1.0;
        endereco.uf = 'Teste';
        endereco.idMunicipio = 1.0;
        endereco.email = 'Teste';
        List<IntegrationModels.Endereco> listEnd = new List<IntegrationModels.Endereco>();
        listEnd.add(endereco);
        
        IntegrationModels.Enderecos ende = new IntegrationModels.Enderecos();
        ende.enderecos=listEnd;
    }
    
    @isTest
    static void municipiosTest(){
        IntegrationModels.Municipio municipio = new IntegrationModels.Municipio();
        municipio.idMunicipio = 1;
        municipio.municipio = 'Teste';
        municipio.uf = 'Teste';
        
        List<IntegrationModels.Municipio> municipiosList = new List<IntegrationModels.Municipio>();
        municipiosList.add(municipio);
        
        IntegrationModels.Municipios municipiosBR = new IntegrationModels.Municipios();
        municipiosBR.municipiosBR = municipiosList;
    }
    
    @isTest
    static void email(){
        IntegrationModels.Email email = new IntegrationModels.Email();
        email.email = 'Teste';
    }
    
    @isTest
    static void dadosBancarios(){
        IntegrationModels.DadosBancarios dadosBancarios = new IntegrationModels.DadosBancarios();
        dadosBancarios.agencia = 1;
        dadosBancarios.agenciaDV = '1';
        dadosBancarios.contaCorrente = 1;
        dadosBancarios.contaCorrenteDV = '1';
        dadosBancarios.agenciaNome = 'Teste';
    }
    
    @isTest
    static void putTelefoneTest(){
        IntegrationModels.PutTelefone tel = new IntegrationModels.PutTelefone();
        tel.ddd1 = 'Test';
        tel.ddd2 = 'Test';
        tel.ddd3 = 'Test';
        tel.ddd4 = 'Test';
        tel.ddi1 = 'Test';
        tel.ddi2 = 'Test';
        tel.ddi3 = 'Test';
        tel.ddi4 = 'Test';
        tel.telefone1 = 'Test';
        tel.telefone2 = 'Test';
        tel.telefone3 = 'Test';
        tel.ramal1 = 'Test';
        tel.ramal2 = 'Test';
        tel.ramal3 = 'Test';
        tel.fax = null;
    }
    
    @isTest
    static IntegrationModels.Telefone telefone(){
        IntegrationModels.Telefone telefone = new IntegrationModels.Telefone();
        telefone.ddi = 'Teste';
        telefone.ddd = 'Teste';
        telefone.telefone = 'Teste';
        telefone.ramal = 'Teste';
        telefone.fax = 'Teste';
        telefone.tipo = 'Celular';
        return telefone;
    }
    
    @isTest
    static void previPatrocinadorTest(){
        IntegrationModels.PreviPatrocinador previPat= new IntegrationModels.PreviPatrocinador();
        previPat.codSituacao = 1;
        previPat.dataFiliacao = '01/01/2010';
        previPat.dataPosse = '02/02/2020';
        previPat.dataPrimPosse = '01/01/200';
        previPat.descSitucao = 'Teste';
        previPat.empresa = 'Previ';
        previPat.omd_status = 'Ativo';
        previPat.plano = '1';
        previPat.sitPrevi = 'Ativo';
        previPat.tempoFiliacao = 36;
        previPat.tpCliente = 'Teste';
    }
    
    @isTest
    static void consultaSituacaoFuncoesTest(){
        IntegrationModels.ConsultaSituacaoFuncoes situFunc = new IntegrationModels.ConsultaSituacaoFuncoes();
        situFunc.codigoSituacao = 1;
        situFunc.dataFim = '01/01/2023';
        situFunc.dataInicio = '0202/2000';
        situFunc.descricao = 'Teste';
    }
    
    @isTest
    static void consultaHistFuncoesTest(){
        IntegrationModels.ConsultaHistFuncoes histFunc= new IntegrationModels.ConsultaHistFuncoes();
        histFunc.codOcupacao = '1';
        histFunc.dataFimVigenc = '02/02/2023';
        histFunc.dataIniVigenc = '01/01/2000';
        histFunc.nomeOcupacao = 'Teste';
    }
    
    @isTest
    static void beneficiariosTest(){
        IntegrationModels.ListBeneficiarios benef = new IntegrationModels.ListBeneficiarios();
        benef.cpf = '142843598';
        benef.numSeqPrevi = 1;
        benef.dependente = 'MARIA DO S.MOTA PASSOS';
        benef.dataNascimento = '1949-02-06';
        benef.idVinculo = 30;
        benef.vinculo = 'CÔNJUGE';
        benef.idEstadoCivil = 2;
        benef.estadoCivil = 'CASADO';
        benef.sexo = 'F';
        benef.invalidez = 'N';
        benef.validar = 'S';
        benef.dataAlteracao = '2022-01-07';
        
        List<IntegrationModels.ListBeneficiarios> benefList = new List<IntegrationModels.ListBeneficiarios>();
        benefList.add(benef);
        
        IntegrationModels.Beneficiarios beneficiarios = new IntegrationModels.Beneficiarios();
        beneficiarios.beneficiarios = benefList;
        beneficiarios.validacaoPendente = false;
    }
    
    @isTest
    static void exDependentesTest(){
        IntegrationModels.ExDependentes exDep = new IntegrationModels.ExDependentes();        
        exDep.codVinculo = 44;
        exDep.nomDep = 'FLAVIO PASSOS  DE SA';
        exDep.cpf = null;
        exDep.estCivil = '1';
        exDep.sexo = 'M';
        exDep.datNasc = '09-06-1988';
        exDep.invidz = 'N';
        exDep.datInsc = null;
        exDep.codExcl = 9;
        exDep.datExcl = '14-06-2012';
    }
    
    @isTest
    static void limitesTest(){
        IntegrationModels.Limites limites = new IntegrationModels.Limites();
        limites.limiteDisponivelNovoEmprestimo = 1.24079;
        limites.limiteMinimoDispNovoEmprestimo = '1E+3';
        limites.margemDisponivelNovoEmprestimo = '3.16466E+3';
        limites.saldoDevedorALiquidar = '0E+0';
        limites.saldoPrestacaoALiquidar = '0E+0';
        limites.totalSaldoPAS = '0E+0';
        limites.totalPrestacaoPAS = '0E+0';
        limites.prazoMaximo = '120';
        limites.prestacaoMaxima = 3.16466;
        limites.indiceReajustePrestacao = '7.87462E-3';
        limites.dataSolicitacaoEmprestimo = '12/04/2023';
        limites.valorAtrasoCFI = 0;
        limites.valorCDP = '0E+0';
        limites.situacaoPrevi = 'ATIVO';
        limites.statusPlano = 'NOR';
        limites.erro = null;
        limites.error = false;
    }
    
    @isTest
    static void opcoesCorrespondencia(){
        IntegrationModels.OpcoesCorrespondencia opcoesCorrespondencia = new IntegrationModels.OpcoesCorrespondencia();
        opcoesCorrespondencia.idCorrespondencia = 1.0;
        opcoesCorrespondencia.correspondencia = 'Teste';
        opcoesCorrespondencia.envioPostal = 'Teste';
        opcoesCorrespondencia.envioEmail = 'Teste';
        opcoesCorrespondencia.envioCelular = 'Teste';
        
        List<IntegrationModels.OpcoesCorrespondencia> listOp = new List<IntegrationModels.OpcoesCorrespondencia>();
        listOp.add(opcoesCorrespondencia);
        
        IntegrationModels.ListOpcoesCorrespondencia listOpcoesCorrespondencia = new IntegrationModels.ListOpcoesCorrespondencia();
        listOpcoesCorrespondencia.opcoesCorrespondencia = listOp;
    }
    
    @isTest
    static void postOpcoesTest(){
        IntegrationModels.PostOpcoes opcoes = new IntegrationModels.PostOpcoes();
        opcoes.envioCelular = 'Sim';
        opcoes.envioEmail = 'Sim';
        opcoes.envioPostal = 'Sim';
        opcoes.idCorrespondencia = 600;
    }
    
    @isTest
    static IntegrationModels.EnderecoAtualizar enderecoAtualizar(){
        IntegrationModels.EnderecoAtualizar enderecoAtualizar = new IntegrationModels.EnderecoAtualizar();
        enderecoAtualizar.logradouro = 'Teste';
        enderecoAtualizar.numero = '1';
        enderecoAtualizar.complemento = 'Teste';
        enderecoAtualizar.bairro = 'Teste';
        enderecoAtualizar.municipio = 'Teste';
        enderecoAtualizar.uf = 'Teste';
        enderecoAtualizar.cep = 'Teste';
        enderecoAtualizar.pais = 'Teste';
        return enderecoAtualizar;
    }
    
    @isTest
    static void PUTatualizarEndereco(){
        IntegrationModels.AtualizarEndereco atualizarEndereco = new IntegrationModels.AtualizarEndereco();
        //public IntegrationModels.EnderecoAtualizar[] atualizar {get;set;}
        List<IntegrationModels.EnderecoAtualizar> listAtualizar = new List<IntegrationModels.EnderecoAtualizar>();
        IntegrationModels.EnderecoAtualizar ende = IntegrationModelsTest.enderecoAtualizar();
        listAtualizar.add(ende);
        atualizarEndereco.atualizar = ende;
        atualizarEndereco.idMatricula = 1;
    }
    
    @isTest
    static void cadastroGecat(){
        IntegrationModels.CadastroGecat cadastroGecat = new IntegrationModels.CadastroGecat();
        cadastroGecat.idPais = 1;
        cadastroGecat.cep = 'Teste';
        cadastroGecat.logradouro = 'Teste';
        cadastroGecat.idMunicipio = 'Teste';
        cadastroGecat.municipio = 'Teste';
        cadastroGecat.bairro = 'Teste';
        cadastroGecat.email = 'Teste';
        IntegrationModels.Telefone tel = IntegrationModelsTest.telefone();
        List<IntegrationModels.Telefone> listTel = new List<IntegrationModels.Telefone>();
        listTel.add(tel);
        IntegrationModels.Telefones telefoneList = new IntegrationModels.Telefones();
        telefoneList.telefones = listTel;
        cadastroGecat.telefone = listTel;
    }
    @isTest
    static void consultaCobranca(){
        IntegrationModels.Remessas remessas = new IntegrationModels.Remessas();
        remessas.cobr = 'FORH';
        remessas.dataCancel = null;
        remessas.dataRealEnv = '03-01-2023';
        remessas.dataRetorno = '13-01-2023';
        remessas.descRetorno = 'Pago';
        remessas.pago = 'S';
        remessas.valCobrado = 333.33;
        List<IntegrationModels.Remessas> listRemessas = new List<IntegrationModels.Remessas>();
        listRemessas.add(remessas);
        
        IntegrationModels.consulta_cobrancas cobrancas = new IntegrationModels.consulta_cobrancas();
        cobrancas.cobranca = 29834246;
        cobrancas.tipoSuspen = 'N';
        cobrancas.status= 2;
        cobrancas.dataVencimento= '20/01/2023';
        cobrancas.dataCompetencia ='01/01/2023';
        cobrancas.valorPrestacao = 333.33;
        cobrancas.tipoMovimento= 'COBR PREST';
        cobrancas.numeroPrestacao = 1;
        cobrancas.erro = false;
        cobrancas.remessas = listRemessas;      
    }
    
    @isTest
    static void consultaDevolucao(){
        List<IntegrationModels.Consulta_devolucao> listDevo = new List<IntegrationModels.Consulta_devolucao>();
        IntegrationModels.Consulta_devolucao devo = new IntegrationModels.Consulta_devolucao();
        devo.dtEvento = 'Teste';
        devo.valorOrigem = '2.2';
        devo.dtReal =  String.valueOf(Date.newInstance(2023, 03, 9));
        devo.valorReal = '3.5';
        devo.status = 'Teste';
        devo.forma = 'Teste';
        devo.erro = false;
        listDevo.add(devo);
    }
    
    @isTest
    static void Propostas(){
        List<IntegrationModels.Propostas> listProposta = new List<IntegrationModels.Propostas>();
        IntegrationModels.Propostas proposta = new IntegrationModels.Propostas();
        proposta.id=2786441;
        proposta.idModalidade=268;
        proposta.modalidade='ES-A 250 PLANO 1';
        proposta.grupoModalidade='ROTATIVO';
        proposta.valorSolicitado=40000.00;
        proposta.valorPrestacaoInicial=1531.22;
        proposta.dataPrevistaCredito='13/02/2023';
        proposta.dataPrevistaEnvioBB=null;
        proposta.dataPrevistaPrimeiraPrestacao='20/03/2023';
        proposta.dataPrevistaFimEmprestimo='20/08/2025';
        proposta.qtdPrestacaoTaxaAdmin=null;
        proposta.prazo=30;
        proposta.prestacoesInciais=30;
        proposta.valorPrestacaoTaxaAdmin=null;
        proposta.valorCredito=32367.21;
        proposta.dataSolicitacao='09/02/2023';
        proposta.valorTaxaAdmin=80.00;
        proposta.valorIOF=1132.65;
        proposta.percentualIOF=2.9930;
        proposta.cancelavel=false;
        proposta.situacaoProposta ='teste';
        proposta.protocoloCadas ='teste';
        proposta.protocoloCancel ='teste';
        proposta.valFQM = 1;
        proposta.valDivFinancImob = 2;
        proposta.valDivPrevi = 2;
        proposta.indOrigemPropos = 'INTERNET';
        proposta.ESLiquidado = 0;
        proposta.verbasPAS = 0;
        proposta.valLiquido = 0;
        proposta.agenciaCreditada = null;
        proposta.contaCreditada = null;
        proposta.posicaoES = null;
        proposta.erro = false;
        listProposta.add(proposta);
    }
    
    @isTest
    static void Extrato(){
        IntegrationModels.Lancamentos lancamentos = new IntegrationModels.Lancamentos();
        List<IntegrationModels.Lancamentos> listLancamentos = new List<IntegrationModels.Lancamentos>();
        
        lancamentos.dataCaixa='13/06/2001';
        lancamentos.dataEvento='13/06/2001';
        lancamentos.tipoMovimento='IMPLANTAÇÃO';
        lancamentos.correcao=1.1;
        lancamentos.juros=1.1;
        lancamentos.fqm=1.1;
        lancamentos.fl=1.1;
        lancamentos.valor=1.1;
        lancamentos.naturezaValor='+';
        lancamentos.saldoDevedor=1.1;
        listLancamentos.add(lancamentos);
        
        IntegrationModels.AmortizacaoPrestacao amortizacaoPrestacao = new IntegrationModels.AmortizacaoPrestacao();
        List<IntegrationModels.AmortizacaoPrestacao> listAmortizacaoPrestacao = new List<IntegrationModels.AmortizacaoPrestacao>();
        amortizacaoPrestacao.dataCaixa= '01/08/2001';
        amortizacaoPrestacao.amortizacao=1.1;
        amortizacaoPrestacao.prestacao= 1.1;
        amortizacaoPrestacao.total= 1.1;
        listAmortizacaoPrestacao.add(amortizacaoPrestacao);
        
        IntegrationModels.Extrato extrato = new IntegrationModels.Extrato();
        Extrato.digitoMatricula='5';
        Extrato.dataContrato='13/06/2001';
        Extrato.prestacaoAtual=1.1;
        Extrato.posicao='Liquidado por recursos próprios';
        Extrato.saldoDevedor=1.1;
        Extrato.taxaJuros=1.1;
        Extrato.taxaFQM=1.1;
        Extrato.taxaFl=1.1;
        Extrato.indiceCorrecao='IGP-DI - ES';
        Extrato.valorCredito=1.1;
        Extrato.valorSolicitado=1.1;
        Extrato.prazoRestante=34;
        Extrato.qtdPrestacoesIniciais=36;
        Extrato.encargos= null;
        Extrato.amortizacaoPrestacao = listAmortizacaoPrestacao;
        Extrato.lancamentos = listLancamentos;
        Extrato.erro = null;
        Extrato.qtdPrestacoesCobradas = null;
        Extrato.qtdPrestacoesPagas = null;
        Extrato.error = false; 
    }
    
    @isTest
    static void EmprestimosLiquidados(){
        IntegrationModels.EmprestimosLiquidados emprestimosLiquidados = new IntegrationModels.EmprestimosLiquidados();
        emprestimosLiquidados.id=997178;
        emprestimosLiquidados.siglaModalidade='ES FINIMOB 110 SÉRIE 12 <= 59';
        emprestimosLiquidados.dataSaldoDevedor='05/07/2018';
        emprestimosLiquidados.valorPrestacao=588.30;
        emprestimosLiquidados.dataCredito='24/04/2012';
        emprestimosLiquidados.valorSolicitado=27000.00;
        emprestimosLiquidados.valorCredito=26173.26;
        emprestimosLiquidados.prazo=96;
        emprestimosLiquidados.qtdPrestacoesIniciais=96;
        emprestimosLiquidados.qtdPrestacoesPagas=71;
        emprestimosLiquidados.qtdPrestacoesCobradas=72;
        emprestimosLiquidados.qtdPrestacoesRestantes=24;
        emprestimosLiquidados.dataSolicitacaoEmprestimo='20/04/2012';
        emprestimosLiquidados.codigoGrupoModalidade='ESFINIMOB';
        emprestimosLiquidados.percentualIOF=2.4820;
        emprestimosLiquidados.siglaMovimento='COBR LIQ RECUR PRÓPR';
        emprestimosLiquidados.dtVencto='05/07/2018';
        emprestimosLiquidados.dtCancel=null;
        emprestimosLiquidados.valorCobrado=5704.23;
        emprestimosLiquidados.valorPag=5704.23;
        emprestimosLiquidados.formaLiqAmort='DCO';
        emprestimosLiquidados.erro = false;        
    }
    
    @isTest
    static void Modalidades(){
        IntegrationModels.Modalidades modalidade = new IntegrationModels.Modalidades();
        modalidade.id='997178';
        modalidade.sigla = 'ES 13º PL 1';
        modalidade.descricao = 'ES 13º PL 1';
        modalidade.grupo = 'ESDECTERC';
        modalidade.erro = false;        
    }
    
    @isTest
    static void Emprestimos(){
        IntegrationModels.Emprestimos emprestimos = new IntegrationModels.Emprestimos();
        emprestimos.id = '2612135';
        emprestimos.idModalidade = '239';
        emprestimos.idModalidadeNova = '2.61E+2';
        emprestimos.siglaModalidade = 'ES-A 120 PLANO2';
        emprestimos.dataSaldoDevedor = '31/01/2023';
        emprestimos.valorSaldoDevedor = '32246.57';
        emprestimos.valorSaldoDevedorAtual = '32280.81';
        emprestimos.valorSaldoTaxaAdministracao = '0';
        emprestimos.qtdPrestacoesTaxaAdministracao = 'null';
        emprestimos.valorPrestacao = '433.11';
        emprestimos.dataCredito = '25/04/2022';
        emprestimos.valorSolicitado = '33573.15';
        emprestimos.valorCredito = '2633.31';
        emprestimos.prazo = '120';
        emprestimos.indicativoEmprestimoProposta = 'EMP';
        emprestimos.indicativoAgendaLiquidez = 'N';
        emprestimos.indicativoCheckLiquidez = 'null';
        emprestimos.qtdPrestacoesIniciais = 120;
        emprestimos.qtdPrestacoesPagas = '9';
        emprestimos.qtdPrestacoesInadimplentes = '0';
        emprestimos.qtdPrestacoesInadimpConsecutivas = '0';
        emprestimos.qtdPrestacoesCobradas = '10';
        emprestimos.qtdPrestacoesRefinanciadas = 'null';
        emprestimos.qtdPrestacoesRestantes = '110';
        emprestimos.qtdPrestacoesCobradasRefinanciadas = 'null';
        emprestimos.dataRefinanciamento = 'null';
        emprestimos.dataSolicitacaoEmprestimo = '20/04/2022';
        emprestimos.situacaoEmprestimo = 'null';
        emprestimos.numContratoSistemaAnterior = 'null';
        emprestimos.codigoGrupoModalidade = 'ROTATIVO';
        emprestimos.percentualIOF = '2.9931';
        emprestimos.indicativoConcessaoAtiva = 'S';
        emprestimos.carencia = 'false';
        emprestimos.msgCarencia = 'null';
        emprestimos.erro = false; 
    }
    
    @isTest
    static void Renegociacao(){
        IntegrationModels.Renegociacao renegociacao = new IntegrationModels.Renegociacao();
        renegociacao.id_proposta_renegc = 21;
        renegociacao.modalidade = 'ES RENEG PL1';
        renegociacao.valorPrestacao = 990.18;
        renegociacao.prestacoesRestantes = 120;
        renegociacao.taxaAtualFQM = 1.200000;
        renegociacao.cancelavel = false;
        renegociacao.numEmprestimo = 1287092;
        renegociacao.protocoloCadas = null;
        renegociacao.protocoloCancel = null;
        renegociacao.status = 'IMPLA';
        renegociacao.dataRenegociacao = '30/11/2015';
        renegociacao.saldoDevedor = 69233.67;
        renegociacao.prestacaoAnt = 1040.37;
        renegociacao.dataImplantacao = '05/12/2015';
        renegociacao.qtdPrestRestante = 97;
        renegociacao.qtdPrestPagas = 11;
        renegociacao.qtdPrestCobradas = 11;
        renegociacao.erro = false;
    }
    
    @isTest
    static void Consulta_impedimento(){
        IntegrationModels.Consulta_impedimento consultaImpedimento = new IntegrationModels.Consulta_impedimento();
        consultaImpedimento.dataInicio = null;
        consultaImpedimento.dataFim = null;
        consultaImpedimento.sigla = null;
        consultaImpedimento.descricaoImpedimento = null;
        consultaImpedimento.erro = false;
    }
    
    @isTest
    static void responseProposta(){
        IntegrationModels.responseProposta propostaPost = new IntegrationModels.responseProposta();
        propostaPost.valorEmprestimo = null;
        propostaPost.valorPrestacao = null;
        propostaPost.prazo = null;
        propostaPost.valorPrestacaoInicial = null;
        propostaPost.taxaAdministracao = null;
        propostaPost.cpmf = null;
        propostaPost.valorCreditado = null;
        propostaPost.dataPrevisaoPrimeiraPrestacao = null;
        propostaPost.dataPrevisaoUltimaPrestacao = null;
        propostaPost.margemDisponivelApos = null;
        propostaPost.valorLimiteDisponivelApos = null;
        propostaPost.taxaAdministracaoQtdPrestacao = null;
        propostaPost.taxaAdministracaoValorPrestacao = null;
        propostaPost.percentualJuros = null;
        propostaPost.percentualFQM = null;
        propostaPost.percentualFL = null;
        propostaPost.percentualIOF = null;
        propostaPost.valorIOF = null;
        propostaPost.valorIOFConcessao = null;
        propostaPost.valorIOFDiferenca = null;
        propostaPost.valorIOFImposto = null;
        propostaPost.valorIOFAmortizacao = null;
        propostaPost.valorTotalEmprestimoPreviLiquidado = null;
        propostaPost.valorTotalEmprestimoBBLiquidado = null;
        propostaPost.valorLiquido = null;
        propostaPost.erro = null;
    }
    
    @isTest
    static void Anotacoes(){
        IntegrationModels.Anotacoes anotacoes = new IntegrationModels.Anotacoes();
        anotacoes.descricaoAnotacao = 'teste';
        anotacoes.dataInclusao = 'teste';
        anotacoes.erro = false;
    }
    
    @isTest
    static void renegCondic(){
        IntegrationModels.renegCondic renegCondic = new IntegrationModels.renegCondic();
        renegCondic.modalidade = 'ES-D 240 PLANO 1';
        renegCondic.prazo = 120;
        renegCondic.prestacaoInicial = 6.3109;
        renegCondic.taxaAtualFQM = 1;
        renegCondic.saldoDevedor = 4.699769;
        renegCondic.temMargemNovoEmprestimo = true;
        renegCondic.erro = false;
    }
    
    @isTest
    static void consultaSuspensao(){
        IntegrationModels.Consulta_suspensao consultaSuspensao = new IntegrationModels.Consulta_suspensao();
        consultaSuspensao.idEmprestimo = 1257751;
        consultaSuspensao.dataParcela= '01/02/2016';
        consultaSuspensao.indSuspensao= 'S';
        consultaSuspensao.erro = false;
    }
    
    @isTest
    static void informacaoAuditorias(){
        IntegrationModels.Consulta_impedimento_audit consultImpAud = new IntegrationModels.Consulta_impedimento_audit();
        consultImpAud.dtEvento = '20-02-2014';
        consultImpAud.justificativa = 'INCONSISTÊNCIA ATUALIZAÇÃO PRIMEIRO DIA DO MÊS';
        consultImpAud.erro = false;
    }
    
    @isTest
    static void lqAmtInformacao(){
        
        IntegrationModels.ProjecaoSaldoDevedor projSaldDev = new IntegrationModels.ProjecaoSaldoDevedor();
        projSaldDev.saldoDevedor = 1.10729 ;
        projSaldDev.saldoTaxaAdministracao = 0;
        projSaldDev.saldoDevedorParaLiquidacao = 1 ;
        projSaldDev.prestacaoAtual = 0;
        projSaldDev.prazoRestante = 40;
        
        IntegrationModels.Eventos eventos = new IntegrationModels.Eventos();
        eventos.id = 1;
        eventos.descricao = 'teste';
        
        IntegrationModels.Opcoes opcoes = new IntegrationModels.Opcoes();
        opcoes.id =1;
        opcoes.descricao = 'Reduzir prazo';
        opcoes.prazo = 6.1;
        opcoes.prestacao = 3.3333;
        opcoes.saldoDevedor = 2.772528903;
        opcoes.indiceReajustePrestacao = 1.116221;
        List<IntegrationModels.Opcoes> listOpcao = new List<IntegrationModels.Opcoes>();
        listOpcao.add(opcoes);
        
        IntegrationModels.Amortizacao amortizacao = new IntegrationModels.Amortizacao();
        amortizacao.opcoes = listOpcao;
        
        List<IntegrationModels.Eventos> listEventos = new  List<IntegrationModels.Eventos>();
        listEventos.add(eventos);
        
        IntegrationModels.lqAmtInformacao lqAmtInf = new IntegrationModels.lqAmtInformacao();
        lqAmtInf.ProjecaoSaldoDevedor = projSaldDev;
        lqAmtInf.Amortizacao = amortizacao;
        lqAmtInf.eventos = listEventos;
        lqAmtInf.formasPagamento = listEventos;
        lqAmtInf.erro = false;
    }
    
    @isTest
    static void dadosAssocciado(){
        
        IntegrationModels.EmprestimosConcedidos EmprestimosConcedidos = new IntegrationModels.EmprestimosConcedidos();
        EmprestimosConcedidos.id = 47900880;
        EmprestimosConcedidos.idModalidade = 13084655;
        EmprestimosConcedidos.siglaModalidade = 'minim';
        EmprestimosConcedidos.dataSaldoDevedor = 'incididun';
        EmprestimosConcedidos.valorSaldoDevedor = 4481282.290559992;
        EmprestimosConcedidos.valorSaldoDevedorAtual = 4088408.4990332723;
        EmprestimosConcedidos.valorSaldoTaxaAdministracao = 42999297;
        EmprestimosConcedidos.qtdPrestacoesTaxaAdministracao = 52908895;
        EmprestimosConcedidos.valorPrestacao = 28551236.79742734;
        EmprestimosConcedidos.dataCredito = 'est';
        EmprestimosConcedidos.valorSolicitado = 8223068.75717546;
        EmprestimosConcedidos.valorCredito = 28861350.22134413;
        EmprestimosConcedidos.prazo = 29496507;
        EmprestimosConcedidos.indicativoEmprestimoProposta = 'non deserunt';
        EmprestimosConcedidos.indicativoAgendaLiquidez = 'minim dolor';
        EmprestimosConcedidos.indicativoCheckLiquidez = 'minim id';
        EmprestimosConcedidos.qtdPrestacoesIniciais = -875016;
        EmprestimosConcedidos.qtdPrestacoesPagas = -35610755;
        EmprestimosConcedidos.qtdPrestacoesInadimplentes = -4325032;
        EmprestimosConcedidos.qtdPrestacoesInadimpConsecutivas = 46943473;
        EmprestimosConcedidos.qtdPrestacoesCobradas = -82567382;
        EmprestimosConcedidos.qtdPrestacoesRefinanciadas = 54903011;
        EmprestimosConcedidos.qtdPrestacoesRestantes = 68532472;
        EmprestimosConcedidos.qtdPrestacoesCobradasRefinanciadas = -48836409;
        EmprestimosConcedidos.dataRefinanciamento = 'id dolor laborum';
        EmprestimosConcedidos.dataSolicitacaoEmprestimo = 'velit';
        EmprestimosConcedidos.situacaoEmprestimo = 'incididunt al';
        EmprestimosConcedidos.numContratoSistemaAnterior = 64306626;
        EmprestimosConcedidos.codigoGrupoModalidade = 'exercitation enim proident';
        EmprestimosConcedidos.percentualIOF = 1028117.9936955571;
        EmprestimosConcedidos.indicativoConcessaoAtiva = 'esse ut ve';
        
        
        List<IntegrationModels.EmprestimosConcedidos> listEmprestimosConcedidos = new List<IntegrationModels.EmprestimosConcedidos>();
        listEmprestimosConcedidos.add(EmprestimosConcedidos);
        
        IntegrationModels.dadosAssocciado dadosAssocciado = new IntegrationModels.dadosAssocciado();
        dadosAssocciado.nome = 'JULIANA DE SOUZA VIEIRA';
        dadosAssocciado.situacaoPrevi = 'ATIVO';
        dadosAssocciado.status = 'NOR';
        dadosAssocciado.codigoEmpresa = 2;
        dadosAssocciado.dataAssinaturaContrato = '20/07/2015';
        dadosAssocciado.plano = 2;
        dadosAssocciado.siglaRemessa = 'FPA';
        dadosAssocciado.valorMargemTotal = 3.16466;
        dadosAssocciado.valorMargemDisponivel = 3.16466;
        dadosAssocciado.valorLimiteTotal = 1.2407913;
        dadosAssocciado.valorLimiteDisponivel = 1.2407913;
        dadosAssocciado.valorTotalPrestacao = 0;
        dadosAssocciado.indicativoCobrancaPrevista = 'PREVIS';
        dadosAssocciado.valorTotalSaldo = 0;
        dadosAssocciado.indicativoAuditoria = 'N';
        dadosAssocciado.indicativoAnotacao = 'N';
        dadosAssocciado.indicativoImpedimento = 'N';
        dadosAssocciado.indicativoCondicao = 'N';
        dadosAssocciado.indicativoInadimplencia = 'N';
        dadosAssocciado.textoAlerta = null;
        dadosAssocciado.cpf = '12248344708';
        dadosAssocciado.codigoAgencia = '5761-4';
        dadosAssocciado.numeroContaCorrente = '6001835-6';
        dadosAssocciado.incapazOuRepLegal = false;
        dadosAssocciado.msgIncapazOuRepLegal = null;
        dadosAssocciado.erro = false;
        dadosAssocciado.emprestimosConcedidos = listEmprestimosConcedidos;
    }
    
    @isTest
    static void OpcaoPagamento(){
        IntegrationModels.opcoesPg op = new IntegrationModels.opcoesPg();
        op.valorEmprestimo = 1000;
        op.valorPrestacao = null;
        op.prazo = 120;
        op.error = false;
    }
    
    @isTest
    static void consultaPensaoMorte(){
        IntegrationModels.ConsultaPensaoMorte consultaPensaoMorte = new IntegrationModels.ConsultaPensaoMorte();
        consultaPensaoMorte.dtAusen=null;
        consultaPensaoMorte.vincPrevi='INSS e PREVI';
        consultaPensaoMorte.especiePrevi='COMPLEMENTO PENSÃO POR MORTE DE APOSENTADO';
        consultaPensaoMorte.dibPrevi='24/04/2001';
        consultaPensaoMorte.situacao='DEF';
        consultaPensaoMorte.dtSituac='24/04/2001';
        consultaPensaoMorte.percPrevi=60.00;
        consultaPensaoMorte.percInss=60.00;
        consultaPensaoMorte.encBenef='PREVI';
        consultaPensaoMorte.enc13='BANCO DO BRASIL';
        consultaPensaoMorte.cAlimen=null;
        consultaPensaoMorte.espec=null;
        consultaPensaoMorte.especieInss='PENSÃO POR MORTE';
        consultaPensaoMorte.dibInss='24/04/2001';
        consultaPensaoMorte.rmi=993.50;
        consultaPensaoMorte.complPrevi=993.50;
        consultaPensaoMorte.complAdicBb=0;
    }
    
    @isTest
    static void historicoBilhetes(){
        IntegrationModels.ConsultaHistoricoBilhete consultaHistoricoBilhete = new IntegrationModels.ConsultaHistoricoBilhete();
        consultaHistoricoBilhete.tipo='MANUTENÇÃO';
        consultaHistoricoBilhete.dataFopag='INSS e PREVI';
        consultaHistoricoBilhete.dataRecalculo='01/01/2013';
        consultaHistoricoBilhete.descricao='TESTE';
        
        List<IntegrationModels.ConsultaHistoricoBilhete> listHistoricoBilhetes = new List<IntegrationModels.ConsultaHistoricoBilhete>();
        listHistoricoBilhetes.add(consultaHistoricoBilhete);
        
        IntegrationModels.ConsultaHistoricoBilhete_Z consultaHistoricoBilheteZ = new IntegrationModels.ConsultaHistoricoBilhete_Z();
        consultaHistoricoBilheteZ.ant19112008='TESTE';
        consultaHistoricoBilheteZ.consulta_historico_bilhete=listHistoricoBilhetes;
    }
    
    @isTest
    static void consultaAposeHistBase(){
        IntegrationModels.ConsultaAposeHistBase consultaAposeHistBase = new IntegrationModels.ConsultaAposeHistBase();
        consultaAposeHistBase.dataCompetencia='04/2023';
        consultaAposeHistBase.dataFopag='04/2023';
        consultaAposeHistBase.valorInss=3405.72;
        consultaAposeHistBase.complPrevi=3405.72;
        consultaAposeHistBase.total=3405.72;
    }
    
    @isTest
    static void gruposFamiliar(){
        IntegrationModels.GruposFamiliar gruposFamiliar = new IntegrationModels.GruposFamiliar();
        gruposFamiliar.grupo=1;
        gruposFamiliar.seqGrupo=2;
        gruposFamiliar.seqBenef=3;
        gruposFamiliar.situacao='ENC';
    }
    
    @isTest
    static void calcularPensionista(){
        IntegrationModels.CalcularPensionista calcularPensionista = new IntegrationModels.CalcularPensionista();
        calcularPensionista.grupo = 1;
        calcularPensionista.dtInic = '24/04/2001';
        calcularPensionista.dtRequer = '30/05/2001';
        calcularPensionista.idPensionista = 102089;
        calcularPensionista.situac = 'ENC';
        calcularPensionista.dtSituac = '24/06/2005';
        calcularPensionista.observacao = 'NOV/04 RECEBIDO RECADASTRAMENTO ASSINADO PELA PRÓPRIA.';
        calcularPensionista.numInss = '119328345-8';
        calcularPensionista.represLegal = 'N';
        calcularPensionista.nome = 'MARIA LIMA MOTTA';
        calcularPensionista.sexo = 'F';
        calcularPensionista.estCiv = '5';
        calcularPensionista.dtNasc = '29/04/1918';
        calcularPensionista.invalidez = 'N';
        calcularPensionista.titular = 'S';
        calcularPensionista.cpf = '315854468-74';
        calcularPensionista.dtInicPrevi = '24/04/2001';
        calcularPensionista.dtInicInss = '01/06/2001';
        calcularPensionista.dtInicCassi = '24/04/2001';
        calcularPensionista.situacao = 'ENC';
        calcularPensionista.dtSituacao = '24/06/2005';
        calcularPensionista.motivoSituac = 'MOR';
        calcularPensionista.vinculo = 'CÔNJUGE';
        calcularPensionista.suspensaoDataPrevi = null;
        calcularPensionista.cotaResguardadaPrevi = 'N';
        calcularPensionista.cotaResguardadaInss = 'N';
        calcularPensionista.percPrevi = 35.00;
        calcularPensionista.percInss = 100.00000000;
        calcularPensionista.fontePgtoPrevi = 'S';
        calcularPensionista.fontePgtoInss = 'S';
        calcularPensionista.fontePgtoBB = 'N';
    }
    
    @isTest
    static void recalcPensaoIndividual(){
        IntegrationModels.RecalcPensaoIndividual recalcPensaoIndividual = new IntegrationModels.RecalcPensaoIndividual();
        recalcPensaoIndividual.cpf = null;
        recalcPensaoIndividual.nome = 'EDNA APARECIDA FERRITE GORGULHO';
        recalcPensaoIndividual.endereco = 'AVENIDA PEDRO DE TOLEDO, 1042';
        recalcPensaoIndividual.cep = 16370000;
        recalcPensaoIndividual.bairro = 'CENTRO';
        recalcPensaoIndividual.municipio = 'PROMISSAO';
        recalcPensaoIndividual.uf = 'SP';
        recalcPensaoIndividual.email = 'fabi.fgorgulho@live.com';
        recalcPensaoIndividual.celular = null;
        recalcPensaoIndividual.ddd = '014';
        recalcPensaoIndividual.telefone = '35410112';
        recalcPensaoIndividual.vigenciaIni = '2012-06-27 00:00:00';
        recalcPensaoIndividual.vigenciaFim = null;
        recalcPensaoIndividual.capacCivil = 'INTERDITO';
        recalcPensaoIndividual.tipoDoc = 1;
    }
    
    @isTest
    static void historicoPensaoMorte(){
        IntegrationModels.HistoricoPensaoMorte historicoPensaoMorte = new IntegrationModels.HistoricoPensaoMorte();
        historicoPensaoMorte.dataInicio = '18/01/2015';
        historicoPensaoMorte.dataFim = '31/05/2015';
        historicoPensaoMorte.inssPercent = 100.00000000;
        historicoPensaoMorte.previPercent = 26.67;
        historicoPensaoMorte.bb = 'N';
        historicoPensaoMorte.inss = 'S';
        historicoPensaoMorte.previ = 'S';
    }
    
    @isTest
    static void consultaCompleMorte(){
        IntegrationModels.ConsultaCompleMorte consultaCompleMorte = new IntegrationModels.ConsultaCompleMorte();
        consultaCompleMorte.dtAusen=null;
        consultaCompleMorte.vincPrevi='INSS e PREVI';
        consultaCompleMorte.especiePrevi='COMPLEMENTO PENSÃO POR MORTE DE APOSENTADO';
        consultaCompleMorte.dibPrevi='24/04/2001';
        consultaCompleMorte.situacao='DEF';
        consultaCompleMorte.dtSituac='24/04/2001';
        consultaCompleMorte.percPrevi=60.00;
        consultaCompleMorte.percInss=60.00;
        consultaCompleMorte.encBenef='PREVI';
        consultaCompleMorte.enc13='BANCO DO BRASIL';
        consultaCompleMorte.espec=null;
        consultaCompleMorte.especieInss='PENSÃO POR MORTE';
        consultaCompleMorte.dibInss='24/04/2001';
        consultaCompleMorte.rmi=993.50;
        consultaCompleMorte.complPrevi=993.50;
        consultaCompleMorte.complAdicBb=0;
    }
    
    @isTest
    static void pendenciaDocumentos(){
        IntegrationModels.PendenciaDocumentos pendenciaDocumentos = new IntegrationModels.PendenciaDocumentos();
        pendenciaDocumentos.descricao_doc='Teste';
        pendenciaDocumentos.data_cadastro='31/05/2015';
    }
    
    @isTest
    static void recadastramento(){
        IntegrationModels.Recadastramento recadastramento = new IntegrationModels.Recadastramento();
        recadastramento.idParticipante=721008;
        recadastramento.tipo='A';
        recadastramento.descricao='teste';
        recadastramento.limitePrimeiraCarta='2021-07-30';
        recadastramento.limiteSegundaCarta='2021-07-30';
        recadastramento.ano=2021;
        recadastramento.observacoes='teste';
        recadastramento.dataRetorno='2021-07-30';
    }
    
    @isTest
    static void concessaoInssPrisma(){
        IntegrationModels.ConcessaoInssPrisma_Z concessaoInssPrismaZ = new IntegrationModels.ConcessaoInssPrisma_Z();
        concessaoInssPrismaZ.data = '15/03/2015';
        concessaoInssPrismaZ.descricao = 'descricao';
        
        List<IntegrationModels.ConcessaoInssPrisma_Z> listConcessaoInssPrisma = new List<IntegrationModels.ConcessaoInssPrisma_Z>();
        listConcessaoInssPrisma.add(concessaoInssPrismaZ);
        
        IntegrationModels.ConcessaoInssPrisma concessaoInssPrisma = new IntegrationModels.ConcessaoInssPrisma();
        concessaoInssPrisma.tipoBenef = 'P';
        concessaoInssPrisma.especieNb = 21;
        concessaoInssPrisma.num_beneficio = '129142238-0';
        concessaoInssPrisma.dib = '15/03/2015';
        concessaoInssPrisma.nome = 'JOSEFA MARIA CORREIA BARBOSA';
        concessaoInssPrisma.cpf = 31273565;
        concessaoInssPrisma.dv = 1;
        concessaoInssPrisma.vinculo = 30;
        concessaoInssPrisma.sexo = 'F';
        concessaoInssPrisma.dataNasc = '23/08/1983';
        concessaoInssPrisma.tit = 'S';
        concessaoInssPrisma.inv = 'N';
        concessaoInssPrisma.rl = 'N';
        concessaoInssPrisma.endereco = 'RUA JOSÉ BRAULIO DE SOUZA';
        concessaoInssPrisma.numero = '244';
        concessaoInssPrisma.complemento = null;
        concessaoInssPrisma.bairro = 'SUTI';
        concessaoInssPrisma.municipio = 'TOBIAS BARRETO';
        concessaoInssPrisma.cep = '49300';
        concessaoInssPrisma.complCep = '000';
        concessaoInssPrisma.uf = 'SE';
        concessaoInssPrisma.dd1 = '079';
        concessaoInssPrisma.dd2 = '079';
        concessaoInssPrisma.dd3 = null;
        concessaoInssPrisma.tel1 = 999264171;
        concessaoInssPrisma.tel2 = 996455587;
        concessaoInssPrisma.tel3 = null;
        concessaoInssPrisma.email = null;
        concessaoInssPrisma.concessao_inss_prisma = listConcessaoInssPrisma;
    }
    
    @isTest
    static void consultaHistAdiantamento(){
        IntegrationModels.ConsultaHistAdiantamento consultaHistAdiantamento = new IntegrationModels.ConsultaHistAdiantamento();
        consultaHistAdiantamento.fopag = '01/03/2004';
        consultaHistAdiantamento.valorEspelho = 5018.04;
        consultaHistAdiantamento.dtCredito = '09/02/2004';
        consultaHistAdiantamento.valorPrevi = 3010.82;
        consultaHistAdiantamento.valorInss = null;
        consultaHistAdiantamento.lancConfirmado = 'Aceito Remessa';
        consultaHistAdiantamento.tipoBeneficio = 'PENSÃO';
        consultaHistAdiantamento.nome = 'CLAUDIO JOSE CARNEIRO DOS SANTOS';
        consultaHistAdiantamento.agencia = 1509;
        consultaHistAdiantamento.contaCorrente = 2078700;
        consultaHistAdiantamento.valPreviLiq = null;
        consultaHistAdiantamento.valInssLiq = null;
    }
}