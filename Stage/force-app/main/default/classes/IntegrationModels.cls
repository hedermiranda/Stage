/****************************************************************************
*                               ília - 2022
*----------------------------------------------------------------------------
*
* Classe para modelagem de objetos de integrações
*
* NAME: IntegrationModels.apxc
* DATE: 25/09/2022
*****************************************************************************/
@suppresssWarnings('pmd.ExcessivePublicCount')
public with sharing class IntegrationModels{
    
    //DADOS CADASTRAIS REQUEST - BEGIN ******************************
    public class CadastroResponse{
        public GetCadastros cadastro {get;set;}
        public String erro {get;set;}
    }
    
    //PUT ENDEREÇOS
    public class AtualizarEndereco{
        public IntegrationModels.EnderecoAtualizar atualizar {get;set;}
        public Integer idMatricula {get;set;}
    } 
    
    public class GetCadastros{                
        public String nome {get;set;}
        public String dataNascimento {get;set;} //rever date
        public String sexo {get;set;}
        public String tipoCliente {get;set;}
        public Integer matricula {get;set;}  
        public Integer codPlano {get;set;}
        public Integer codSituacaoEmpresa {get;set;}
        public String situacaoEmpresa {get;set;}
        public String situacaoPrevi {get;set;}
        public String statusPrevi {get;set;}
        public Integer codEmpresa {get;set;}
        public String nomeEmpresa {get;set;}
        public Integer numSeqPrevi {get;set;}
        public String email {get;set;}
        public String cpf {get;set;}         
        public String estadoCivil {get;set;}
        public Integer idEstadoCivil {get;set;}
        public String tipo {get;set;}
        public String codigoNumero {get;set;}
        public String emissao {get;set;} //rever date
        public String orgaoEmissor {get;set;}
        public String pisPasep {get;set;}
        public String pai {get;set;}
        public String mae {get;set;}
        public String nacionalidade {get;set;}
        public String naturalidade {get;set;}
        public Integer capacCivil {get;set;}
        public String descCapacCivil {get;set;}
        public String erro {get;set;}
    }
    
    public class Enderecos{
        public List<Endereco> enderecos {get;set;}
        
    }
    public class Endereco{
        public String endereco {get;set;}
        public String cep {get;set;}
        public String bairro {get;set;}
        public Double idPais {get;set;}
        public String uf {get;set;}
        public Double idMunicipio {get;set;}
        public String email {get;set;}
    }
    
    public class Municipios{
        public List<Municipio> municipiosBR {get;set;}
    }
    
    public class Municipio{
        public Integer idMunicipio {get;set;}
        public String municipio {get;set;}
        public String uf {get;set;}
    }
    public class Email{
        public String email {get;set;}
    }
    
    //Cadastro - Dados Bancarios GET E POST
    public class DadosBancarios{
        public Integer agencia {get;set;}
        public String agenciaDV {get;set;}
        public String agenciaNome {get;set;}
        public Integer contaCorrente {get;set;}
        public String contaCorrenteDV {get;set;}
    }
    
    /*public class PostDadosBancarios{
public Integer agencia {get;set;}
public Integer agenciaDV {get;set;}
public Integer contaCorrente {get;set;}
public Integer contaCorrenteDV {get;set;}
}*/
    
    //Classe utilizada para o método PUT - Atualização ou insert de registro no legado
    
    public class PutTelefone{
        public String ddd1 {get;set;}
        public String ddd2 {get;set;}
        public String ddd3 {get;set;}
        public String ddd4 {get;set;}
        public String ddi1 {get;set;}
        public String ddi2 {get;set;}
        public String ddi3 {get;set;}
        public String ddi4 {get;set;}
        public String telefone1 {get;set;}
        public String telefone2 {get;set;}
        public String telefone3 {get;set;}
        public String ramal1 {get;set;}
        public String ramal2 {get;set;}
        public String ramal3 {get;set;}
        public String fax {get;set;}
        //public integer idMatricula {get;set;}
    }
    
    public class ListOpcoesCorrespondencia{
        public List<OpcoesCorrespondencia> opcoesCorrespondencia {get;set;}
    }
    // Método para montar o POST das opções de correspondência 
    public class OpcoesCorrespondencia{
        public Double idCorrespondencia {get;set;}
        public String correspondencia {get;set;}
        public String envioPostal {get;set;}
        public String envioEmail {get;set;}
        public String envioCelular {get;set;}
    }
    
    public class PostOpcoes{
        public Integer idCorrespondencia {get;set;}
        public String envioPostal {get;set;}
        public String envioEmail {get;set;}
        public String envioCelular {get;set;}
    }
    
    
    //Classe para método POST dos dados cadastrais dos participantes quando o tipo de relacionamento for GECAT
    public class CadastroGecat{
        public Integer idPais {get;set;}
        public String cep {get;set;}
        public String logradouro {get;set;}
        public String idMunicipio {get;set;}
        public String municipio {get;set;}
        public String bairro {get;set;}
        public String email {get;set;}
        public IntegrationModels.Telefone[] telefone {get;set;}
    }
    
    //Classe para método POST dos dados cadastrais dos participantes quando o tipo de relacionamento for CAPEC
    public class CadastroCapec{
        
    }
    
    //Classe para método POST dos dados cadastrais dos participantes quando o tipo de relacionamento for Benef
    public class CadastroBenef{
        
    }
    
    //Put para endereços - Não precisa mais usar o tipo de formulário. 
    //
    public class EnderecoAtualizar{
        public String logradouro {get;set;}
        public String numero {get;set;}
        public String complemento {get;set;}
        public String bairro {get;set;}
        public String municipio {get;set;}
        public String uf {get;set;}
        public String cep {get;set;}
        public String pais {get;set;}        
    }
    
    //GET TELEFONES
    public class Telefones{
        public List<Telefone> telefones {get;set;}
    }
    
    public class Telefone{
        public String ddi {get;set;}
        public String ddd {get;set;}
        public String telefone {get;set;}
        public String ramal {get;set;}
        public String fax {get;set;}
        public String tipo {get;set;}
    }
    
    //Cadastro - Previ Patrocinador
    public class PreviPatrocinador{
        public String plano {get;set;}
        public String sitPrevi {get;set;}
        public String empresa {get;set;}
        public Integer codSituacao {get;set;}
        public String descSitucao {get;set;}
        public String omd_status {get;set;}
        public String tpCliente {get;set;}
        public String dataPosse {get;set;}
        public String dataPrimPosse {get;set;}
        public String dataFiliacao {get;set;}
        public Integer tempoFiliacao {get;set;}
    }
    
    //Cadastro - Historico Situações Funcionais
    @AuraEnabled public List<ConsultaSituacaoFuncoes> consulta_situacao_funcoes;
    
    public class ConsultaSituacaoFuncoes{
        @AuraEnabled public Integer codigoSituacao {get;set;}
        @AuraEnabled public String descricao {get;set;}
        @AuraEnabled public String dataInicio {get;set;}
        @AuraEnabled public String dataFim {get;set;}        
    }
    
    //Cadastro - Funções
    @AuraEnabled  public List<ConsultaHistFuncoes> consulta_hist_funcoes;
    
    public class ConsultaHistFuncoes{
        @AuraEnabled public String codOcupacao {get;set;}
        @AuraEnabled public String nomeOcupacao {get;set;}
        @AuraEnabled public String dataIniVigenc {get;set;}
        @AuraEnabled public String dataFimVigenc {get;set;}        
    }
    
    //Cadastro - Beneficiários
    public class Beneficiarios{
        public List<ListBeneficiarios> beneficiarios {get;set;} 
        public Boolean validacaoPendente {get;set;} 
    }
    
    public class ListBeneficiarios{
        public Integer numSeqPrevi {get;set;}
        public String cpf {get;set;}
        public String dependente {get;set;}
        public String dataNascimento {get;set;}  
        public Integer idVinculo {get;set;}
        public String vinculo {get;set;}
        public Integer idEstadoCivil {get;set;}
        public String estadoCivil {get;set;}  
        public String sexo {get;set;}
        public String invalidez {get;set;}
        public String validar {get;set;}
        public String dataAlteracao {get;set;}  
    }
    
    //Cadastro - Ex Dependentes
    public List<ExDependentes> consulta_ex_dependentes;
    
    public class ExDependentes{
        public Integer codVinculo {get;set;}
        public String nomDep {get;set;}
        public String cpf {get;set;}
        public String estCivil {get;set;}
        public String sexo {get;set;}  
        public String datNasc {get;set;}
        public String invidz {get;set;}
        public String datInsc {get;set;}
        public Integer codExcl {get;set;}  
        public String datExcl {get;set;}
    }
    
    //Cadastro - Licencas Interesses
    @AuraEnabled public List<LicencaInteresses> consulta_interesses;
    
    public class LicencaInteresses{
        @AuraEnabled public String dataIniVigenc {get;set;}
        @AuraEnabled public String dataFimVigenc {get;set;}
        @AuraEnabled public String codSituac {get;set;}
        @AuraEnabled public String nomSituac {get;set;}
    }
    
    //Cadastro - Representantes Legais
    @AuraEnabled public List<RepresentantesLegais> consulta_repres_legal;
    
    public class RepresentantesLegais{
        //@AuraEnabled public String descSituacao {get;set;}
        @AuraEnabled public String descObs {get;set;}
        @AuraEnabled public String dataIni {get;set;}
        @AuraEnabled public String dataFim {get;set;}
        @AuraEnabled public String dataIncl {get;set;}
        @AuraEnabled public String represLegal {get;set;}
        @AuraEnabled public String cpfRepresLegal {get;set;}
        @AuraEnabled public String endRepresLegal {get;set;}
        @AuraEnabled public String bairro {get;set;}
        @AuraEnabled public String municipio {get;set;}
        @AuraEnabled public String codigoUF {get;set;}
        @AuraEnabled public String codigoCEP {get;set;}
        @AuraEnabled public String codigoDDD {get;set;}
        @AuraEnabled public String numTel {get;set;}
        @AuraEnabled public String numCel {get;set;}
        @AuraEnabled public String email {get;set;}
    }
    
    //Cadastro - Historico Email
    @AuraEnabled public List<HistEmail> consulta_hist_emails;
    
    public class HistEmail{
        @AuraEnabled public String dataLog {get;set;}
        @AuraEnabled public String UsuarioInclusao {get;set;}
        @AuraEnabled public String endEmail {get;set;}
    }
    
    //Cadastro - Historico Endereço
    @AuraEnabled public List<HistEndereco> consulta_hist_ends;
    
    public class HistEndereco{
        @AuraEnabled public String datLog {get;set;}
        @AuraEnabled public String Usuario {get;set;}
        @AuraEnabled public String nom_atrib {get;set;}
        @AuraEnabled public String val_atrib {get;set;}
        @AuraEnabled public String municipio {get;set;}
        @AuraEnabled public String estado {get;set;}
        @AuraEnabled public String pais {get;set;}
    }
    
    //Cadastro - Telefones
    @AuraEnabled public List<HistTelefones> consulta_hist_tels;
    
    public class HistTelefones{
        @AuraEnabled public String datLog {get;set;}
        @AuraEnabled public String Usuario {get;set;}
        @AuraEnabled public String nom_atrib {get;set;}
        @AuraEnabled public String val_atrib {get;set;}
    }
    
    //Emprestimo Simples - GET Cobrança
    
    public class Remessas {
        @AuraEnabled public String cobr{get;set;}
        @AuraEnabled public String dataCancel{get;set;}
        @AuraEnabled public String dataRealEnv{get;set;}
        @AuraEnabled public String dataRetorno{get;set;}
        @AuraEnabled public String descRetorno{get;set;}
        @AuraEnabled public String pago{get;set;}
        @AuraEnabled public Double valCobrado{get;set;}
    }
    
    public class consulta_cobrancas {
        @AuraEnabled public Integer cobranca{get;set;}
        @AuraEnabled public String tipoSuspen{get;set;}
        @AuraEnabled public Double status{get;set;}
        @AuraEnabled public String dataVencimento{get;set;}
        @AuraEnabled public String dataCompetencia{get;set;}
        @AuraEnabled public Double valorPrestacao{get;set;}
        @AuraEnabled public String tipoMovimento{get;set;}
        @AuraEnabled public Integer numeroPrestacao{get;set;}
        @AuraEnabled public List<Remessas> remessas{get;set;}
        @AuraEnabled public Boolean erro{get;set;}
        
    }
    
    //Emprestimo Simples - GET Devoluções
    @AuraEnabled public List<Consulta_devolucao> consulta_devolucao;
    
    public class Consulta_devolucao {
        @AuraEnabled public String dtEvento {get;set;}
        @AuraEnabled public String valorOrigem {get;set;}
        @AuraEnabled public String dtReal {get;set;}
        @AuraEnabled public String valorReal {get;set;}
        @AuraEnabled public String status {get;set;}
        @AuraEnabled public String forma {get;set;}
        @AuraEnabled public Boolean erro{get;set;}
    }
    
    
    //Emprestimo Simples - GET Propostas
    public class Propostas {
        @AuraEnabled public Integer id{get;set;}
        @AuraEnabled public Integer idModalidade{get;set;}
        @AuraEnabled public String modalidade{get;set;}
        @AuraEnabled public String posicaoES{get;set;}
        @AuraEnabled public String grupoModalidade{get;set;}
        @AuraEnabled public Double valorSolicitado{get;set;}
        @AuraEnabled public Double valorPrestacaoInicial{get;set;}
        @AuraEnabled public String dataPrevistaCredito{get;set;}
        @AuraEnabled public String dataPrevistaEnvioBB{get;set;}
        @AuraEnabled public String dataPrevistaPrimeiraPrestacao{get;set;}
        @AuraEnabled public String dataPrevistaFimEmprestimo{get;set;}
        @AuraEnabled public String qtdPrestacaoTaxaAdmin{get;set;}
        @AuraEnabled public Integer prazo{get;set;}
        @AuraEnabled public Integer prestacoesInciais{get;set;}
        @AuraEnabled public String valorPrestacaoTaxaAdmin{get;set;}
        @AuraEnabled public Double valorCredito{get;set;}
        @AuraEnabled public String dataSolicitacao{get;set;}
        @AuraEnabled public Double valorTaxaAdmin{get;set;}
        @AuraEnabled public Double valorIOF{get;set;}
        @AuraEnabled public Double percentualIOF{get;set;}
        @AuraEnabled public String situacaoProposta{get;set;}
        @AuraEnabled public String protocoloCadas{get;set;}
        @AuraEnabled public String protocoloCancel{get;set;}
        @AuraEnabled public Boolean cancelavel{get;set;}
        @AuraEnabled public Double valFQM {get;set;}
        @AuraEnabled public Double valDivFinancImob {get;set;}
        @AuraEnabled public Double valDivPrevi {get;set;}
        @AuraEnabled public String indOrigemPropos{get;set;}
        @AuraEnabled public Double ESLiquidado {get;set;}
        @AuraEnabled public Double verbasPAS {get;set;}
        @AuraEnabled public Double valLiquido {get;set;}
        @AuraEnabled public String agenciaCreditada {get;set;}
        @AuraEnabled public String contaCreditada {get;set;}
        @AuraEnabled public Boolean erro{get;set;}
        
    }
    
    //Emprestimo Simples - GET Extrato
    public class Extrato {
        
        @AuraEnabled public String digitoMatricula{get;set;}
        @AuraEnabled public String dataContrato{get;set;}
        @AuraEnabled public Double prestacaoAtual{get;set;}
        @AuraEnabled public String posicao{get;set;}
        @AuraEnabled public Double saldoDevedor{get;set;}
        @AuraEnabled public Double taxaJuros{get;set;}
        @AuraEnabled public Double taxaFQM{get;set;}
        @AuraEnabled public Double taxaFl{get;set;}
        @AuraEnabled public String indiceCorrecao{get;set;}
        @AuraEnabled public Double valorCredito{get;set;}
        @AuraEnabled public Double valorSolicitado{get;set;}
        @AuraEnabled public Integer prazoRestante{get;set;}
        @AuraEnabled public Integer qtdPrestacoesIniciais{get;set;}
        @AuraEnabled public List<Encargos> encargos{get;set;}
        @AuraEnabled public List<AmortizacaoPrestacao> amortizacaoPrestacao{get;set;}
        @AuraEnabled public List<Lancamentos> lancamentos{get;set;}
        @AuraEnabled public String erro{get;set;}
        @AuraEnabled public String qtdPrestacoesCobradas{get;set;}
        @AuraEnabled public String qtdPrestacoesPagas{get;set;}
        @AuraEnabled public Boolean error{get;set;}
        
    }
    public class Encargos {
    }
    
    public class AmortizacaoPrestacao {
        @AuraEnabled public String dataCaixa{get;set;}
        @AuraEnabled public Double amortizacao{get;set;}
        @AuraEnabled public Double prestacao{get;set;}
        @AuraEnabled public Double total{get;set;}
    }
    
    public class Lancamentos {
        @AuraEnabled public String dataCaixa{get;set;}
        @AuraEnabled public String dataEvento{get;set;}
        @AuraEnabled public String tipoMovimento{get;set;}
        @AuraEnabled public Double correcao{get;set;}
        @AuraEnabled public Double juros{get;set;}
        @AuraEnabled public Double fqm{get;set;}
        @AuraEnabled public Double fl{get;set;}
        @AuraEnabled public Double valor{get;set;}
        @AuraEnabled public String naturezaValor{get;set;}
        @AuraEnabled public Double saldoDevedor{get;set;}
    }
    
    //Emprestimo Simples - get Emprestimos-liquidados
    @AuraEnabled public List<EmprestimosLiquidados> emprestimosLiquidados;
    
    public class EmprestimosLiquidados {
        @AuraEnabled public Integer id{get;set;}
        @AuraEnabled public String siglaModalidade{get;set;}
        @AuraEnabled public String dataSaldoDevedor{get;set;}
        @AuraEnabled public Double valorPrestacao{get;set;}
        @AuraEnabled public String dataCredito{get;set;}
        @AuraEnabled public Double valorSolicitado{get;set;}
        @AuraEnabled public Double valorCredito{get;set;}
        @AuraEnabled public Integer prazo{get;set;}
        @AuraEnabled public Integer qtdPrestacoesIniciais{get;set;}
        @AuraEnabled public Integer qtdPrestacoesPagas{get;set;}
        @AuraEnabled public Integer qtdPrestacoesCobradas{get;set;}
        @AuraEnabled public Integer qtdPrestacoesRestantes{get;set;}
        @AuraEnabled public String dataSolicitacaoEmprestimo{get;set;}
        @AuraEnabled public String codigoGrupoModalidade{get;set;}
        @AuraEnabled public Double percentualIOF{get;set;}
        @AuraEnabled public String siglaMovimento{get;set;}
        @AuraEnabled public String dtVencto{get;set;}
        @AuraEnabled public String dtCancel{get;set;}
        @AuraEnabled public Double valorCobrado{get;set;}
        @AuraEnabled public Double valorPag{get;set;}
        @AuraEnabled public String formaLiqAmort{get;set;}
        @AuraEnabled public Boolean erro{get;set;}
        
    }
    
    //Emprestimo Simples - Get Modalidades
    public class Modalidades {
        @AuraEnabled public String id{get;set;}
        @AuraEnabled public String sigla{get;set;}
        @AuraEnabled public String descricao{get;set;}
        @AuraEnabled public String grupo{get;set;}
        @AuraEnabled public Boolean erro{get;set;}
        
    }
    
    //Emprestimo Simples - Get Emprestimos
    public class Emprestimos {
        @AuraEnabled public String id{get;set;}
        @AuraEnabled public String idModalidade{get;set;}
        @AuraEnabled public String idModalidadeNova{get;set;}
        @AuraEnabled public String siglaModalidade{get;set;}
        @AuraEnabled public String dataSaldoDevedor{get;set;}
        @AuraEnabled public String valorSaldoDevedor{get;set;}
        @AuraEnabled public String valorSaldoDevedorAtual{get;set;}
        @AuraEnabled public String valorSaldoTaxaAdministracao{get;set;}
        @AuraEnabled public String qtdPrestacoesTaxaAdministracao{get;set;}
        @AuraEnabled public String valorPrestacao{get;set;}
        @AuraEnabled public String dataCredito{get;set;}
        @AuraEnabled public String valorSolicitado{get;set;}
        @AuraEnabled public String valorCredito{get;set;}
        @AuraEnabled public String prazo{get;set;}
        @AuraEnabled public String indicativoEmprestimoProposta{get;set;}
        @AuraEnabled public String indicativoAgendaLiquidez{get;set;}
        @AuraEnabled public String indicativoCheckLiquidez{get;set;}
        @AuraEnabled public Double qtdPrestacoesIniciais{get;set;}
        @AuraEnabled public String qtdPrestacoesPagas{get;set;}
        @AuraEnabled public String qtdPrestacoesInadimplentes{get;set;}
        @AuraEnabled public String qtdPrestacoesInadimpConsecutivas{get;set;}
        @AuraEnabled public String qtdPrestacoesCobradas{get;set;}
        @AuraEnabled public String qtdPrestacoesRefinanciadas{get;set;}
        @AuraEnabled public String qtdPrestacoesRestantes{get;set;}
        @AuraEnabled public String qtdPrestacoesCobradasRefinanciadas{get;set;}
        @AuraEnabled public String dataRefinanciamento{get;set;}
        @AuraEnabled public String dataSolicitacaoEmprestimo{get;set;}
        @AuraEnabled public String situacaoEmprestimo{get;set;}
        @AuraEnabled public String numContratoSistemaAnterior{get;set;}
        @AuraEnabled public String codigoGrupoModalidade{get;set;}
        @AuraEnabled public String percentualIOF{get;set;}
        @AuraEnabled public String indicativoConcessaoAtiva{get;set;}
        @AuraEnabled public String carencia{get;set;}
        @AuraEnabled public String msgCarencia{get;set;}
        @AuraEnabled public Boolean erro{get;set;}
    }
    
    //Emprestimo Simples - Get impedimentos	
    
    public class Consulta_impedimento {
        @AuraEnabled public String dataInicio {get;set;}
        @AuraEnabled public String dataFim{get;set;}
        @AuraEnabled public String sigla{get;set;}
        @AuraEnabled public String descricaoImpedimento{get;set;}
        @AuraEnabled public Boolean erro{get;set;}
    }
    
    //Emprestimo Simples - getLimites
    public class Limites {
        @AuraEnabled public Double limiteDisponivelNovoEmprestimo{get;set;}
        @AuraEnabled public String limiteMinimoDispNovoEmprestimo{get;set;}
        @AuraEnabled public String margemDisponivelNovoEmprestimo{get;set;}
        @AuraEnabled public String saldoDevedorALiquidar{get;set;}
        @AuraEnabled public String saldoPrestacaoALiquidar{get;set;}
        @AuraEnabled public String totalSaldoPAS{get;set;}
        @AuraEnabled public String totalPrestacaoPAS{get;set;}
        @AuraEnabled public String prazoMaximo{get;set;}
        @AuraEnabled public Double prestacaoMaxima{get;set;}
        @AuraEnabled public String indiceReajustePrestacao{get;set;}
        @AuraEnabled public String dataSolicitacaoEmprestimo{get;set;}
        @AuraEnabled public Double valorAtrasoCFI{get;set;}
        @AuraEnabled public String valorCDP{get;set;}
        @AuraEnabled public String situacaoPrevi{get;set;}
        @AuraEnabled public String statusPlano{get;set;}
        @AuraEnabled public string erro{get;set;}
        @AuraEnabled public Boolean error{get;set;}
        
        
        
    }
    
    //Emprestimo Simples - Get Renegociacao
    public class Renegociacao {
        @AuraEnabled public Integer id_proposta_renegc{get;set;}
        @AuraEnabled public String modalidade{get;set;}
        @AuraEnabled public Double valorPrestacao{get;set;}
        @AuraEnabled public Integer prestacoesRestantes{get;set;}
        @AuraEnabled public Double taxaAtualFQM{get;set;}
        @AuraEnabled public Boolean cancelavel{get;set;}
        @AuraEnabled public Integer numEmprestimo{get;set;}
        @AuraEnabled public String protocoloCadas{get;set;}
        @AuraEnabled public String protocoloCancel{get;set;}
        @AuraEnabled public String status{get;set;}
        @AuraEnabled public String dataRenegociacao{get;set;}
        @AuraEnabled public Double saldoDevedor{get;set;}
        @AuraEnabled public Double prestacaoAnt{get;set;}
        @AuraEnabled public String dataImplantacao{get;set;}
        @AuraEnabled public Integer qtdPrestRestante{get;set;}
        @AuraEnabled public Integer qtdPrestPagas{get;set;}
        @AuraEnabled public Integer qtdPrestCobradas{get;set;}
        @AuraEnabled public Boolean erro{get;set;}        
    }
    
    //Emprestimo Simples - Post Propostas
    public class responseProposta {
        @AuraEnabled public Double valorEmprestimo{get;set;}
        @AuraEnabled public Double valorPrestacao{get;set;}
        @AuraEnabled public Double prazo{get;set;}
        @AuraEnabled public Double valorPrestacaoInicial{get;set;}
        @AuraEnabled public String taxaAdministracao{get;set;}
        @AuraEnabled public Double cpmf{get;set;}
        @AuraEnabled public Double valorCreditado{get;set;}
        @AuraEnabled public String dataPrevisaoPrimeiraPrestacao{get;set;}
        @AuraEnabled public String dataPrevisaoUltimaPrestacao{get;set;}
        @AuraEnabled public String margemDisponivelApos{get;set;}
        @AuraEnabled public Double valorLimiteDisponivelApos{get;set;}
        @AuraEnabled public String taxaAdministracaoQtdPrestacao{get;set;}
        @AuraEnabled public String taxaAdministracaoValorPrestacao{get;set;}
        @AuraEnabled public String percentualJuros{get;set;}
        @AuraEnabled public String percentualFQM{get;set;}
        @AuraEnabled public String percentualFL{get;set;}
        @AuraEnabled public String percentualIOF{get;set;}
        @AuraEnabled public Double valorIOF{get;set;}
        @AuraEnabled public Double valorIOFConcessao{get;set;}
        @AuraEnabled public Double valorIOFDiferenca{get;set;}
        @AuraEnabled public Double valorIOFImposto{get;set;}
        @AuraEnabled public Double valorIOFAmortizacao{get;set;}
        @AuraEnabled public Double valorTotalEmprestimoPreviLiquidado{get;set;}
        @AuraEnabled public Double valorTotalEmprestimoBBLiquidado{get;set;}
        @AuraEnabled public Double valorLiquido{get;set;}
        @AuraEnabled public String erro{get;set;}        
        @AuraEnabled public Boolean error{get;set;}        
    }
    
    //Emprestimo Simples - Get Anotacao
    public class Anotacoes {
        @AuraEnabled public String descricaoAnotacao{get;set;}
        @AuraEnabled public String dataInclusao{get;set;}
        @AuraEnabled public Boolean erro{get;set;}        
    }
    
    //Emprestimo Simples - Get Renegociações e Condições
    public class renegCondic {
        @AuraEnabled public String modalidade{get;set;}	
        @AuraEnabled public Integer prazo{get;set;}	
        @AuraEnabled public Double prestacaoInicial{get;set;}	
        @AuraEnabled public Double taxaAtualFQM{get;set;}	
        @AuraEnabled public Double saldoDevedor{get;set;}	
        @AuraEnabled public Boolean temMargemNovoEmprestimo{get;set;}	
        @AuraEnabled public Boolean erro{get;set;}        
    }
    
    //Emprestimo Simples - Get get Suspensao Pagamentos
    public class Consulta_suspensao {
        @AuraEnabled public Integer idEmprestimo{get;set;}
        @AuraEnabled public String dataParcela{get;set;}
        @AuraEnabled public String indSuspensao{get;set;}
        @AuraEnabled public Boolean erro{get;set;}        
    }
    
    //Emprestimo Simples - Get get Informações Auditórias
    public class Consulta_impedimento_audit {
        @AuraEnabled public String dtEvento{get;set;}
        @AuraEnabled public String justificativa{get;set;}
        @AuraEnabled public Boolean erro{get;set;}
    }
    
    //Emprestimo Simples - get Informacoes amortizacoes-liquidacoes/informacoes
    public class ProjecaoSaldoDevedor {
        @AuraEnabled public Double saldoDevedor{get;set;}
        @AuraEnabled public Double saldoTaxaAdministracao{get;set;}
        @AuraEnabled public Double saldoDevedorParaLiquidacao{get;set;}
        @AuraEnabled public Double prestacaoAtual{get;set;}
        @AuraEnabled public Integer prazoRestante{get;set;}
    }
    
    public class Eventos {
        @AuraEnabled public Integer id{get;set;}
        @AuraEnabled public String descricao{get;set;}
    }
    
    public class Opcoes {
        @AuraEnabled public Double id{get;set;}
        @AuraEnabled public String descricao{get;set;}
        @AuraEnabled public Double prazo{get;set;}
        @AuraEnabled public Double prestacao{get;set;}
        @AuraEnabled public Double saldoDevedor{get;set;}
        @AuraEnabled public Double indiceReajustePrestacao{get;set;}
    }
    
    public class Amortizacao {
        @AuraEnabled public List<Opcoes> opcoes{get;set;}
    }
    
    public class lqAmtInformacao{
        @AuraEnabled public ProjecaoSaldoDevedor projecaoSaldoDevedor{get;set;}
        @AuraEnabled public Amortizacao amortizacao{get;set;}
        @AuraEnabled public List<Eventos> eventos{get;set;}
        @AuraEnabled public List<Eventos> formasPagamento{get;set;}
        @AuraEnabled public Boolean erro{get;set;}
    }
    
    //Emprestimo Simples - get Dados Associados
    public class dadosAssocciado {
        
        @AuraEnabled public String nome{get;set;}
        @AuraEnabled public String situacaoPrevi{get;set;}
        @AuraEnabled public String status{get;set;}
        @AuraEnabled public Integer codigoEmpresa{get;set;}
        @AuraEnabled public String dataAssinaturaContrato{get;set;}
        @AuraEnabled public Integer plano{get;set;}
        @AuraEnabled public String siglaRemessa{get;set;}
        @AuraEnabled public Double valorMargemTotal{get;set;}
        @AuraEnabled public Double valorMargemDisponivel{get;set;}
        @AuraEnabled public Double valorLimiteTotal{get;set;}
        @AuraEnabled public Double valorLimiteDisponivel{get;set;}
        @AuraEnabled public Double valorTotalPrestacao{get;set;}
        @AuraEnabled public String indicativoCobrancaPrevista{get;set;}
        @AuraEnabled public Double valorTotalSaldo{get;set;}
        @AuraEnabled public String indicativoAuditoria{get;set;}
        @AuraEnabled public String indicativoAnotacao{get;set;}
        @AuraEnabled public String indicativoImpedimento{get;set;}
        @AuraEnabled public String indicativoCondicao{get;set;}
        @AuraEnabled public String indicativoInadimplencia{get;set;}
        @AuraEnabled public String textoAlerta{get;set;}
        @AuraEnabled public String cpf{get;set;}
        @AuraEnabled public String codigoAgencia{get;set;}
        @AuraEnabled public String numeroContaCorrente{get;set;}
        @AuraEnabled public Boolean incapazOuRepLegal{get;set;}
        @AuraEnabled public String msgIncapazOuRepLegal{get;set;}
        @AuraEnabled public List<EmprestimosConcedidos> emprestimosConcedidos{get;set;}
        @AuraEnabled public Boolean erro{get;set;}
    }
    
    public class EmprestimosConcedidos {
        @AuraEnabled public Double id{get;set;}
        @AuraEnabled public Double idModalidade{get;set;}
        @AuraEnabled public String siglaModalidade{get;set;}
        @AuraEnabled public String dataSaldoDevedor{get;set;}
        @AuraEnabled public Double valorSaldoDevedor{get;set;}
        @AuraEnabled public Double valorSaldoDevedorAtual{get;set;}
        @AuraEnabled public Double valorSaldoTaxaAdministracao{get;set;}
        @AuraEnabled public Double qtdPrestacoesTaxaAdministracao{get;set;}
        @AuraEnabled public Double valorPrestacao{get;set;}
        @AuraEnabled public String dataCredito{get;set;}
        @AuraEnabled public Double valorSolicitado{get;set;}
        @AuraEnabled public Double valorCredito{get;set;}
        @AuraEnabled public Double prazo{get;set;}
        @AuraEnabled public String indicativoEmprestimoProposta{get;set;}
        @AuraEnabled public String indicativoAgendaLiquidez{get;set;}
        @AuraEnabled public String indicativoCheckLiquidez{get;set;}
        @AuraEnabled public Double qtdPrestacoesIniciais{get;set;}
        @AuraEnabled public Double qtdPrestacoesPagas{get;set;}
        @AuraEnabled public Double qtdPrestacoesInadimplentes{get;set;}
        @AuraEnabled public Double qtdPrestacoesInadimpConsecutivas{get;set;}
        @AuraEnabled public Double qtdPrestacoesCobradas{get;set;}
        @AuraEnabled public Double qtdPrestacoesRefinanciadas{get;set;}
        @AuraEnabled public Double qtdPrestacoesRestantes{get;set;}
        @AuraEnabled public Double qtdPrestacoesCobradasRefinanciadas{get;set;}
        @AuraEnabled public String dataRefinanciamento{get;set;}
        @AuraEnabled public String dataSolicitacaoEmprestimo{get;set;}
        @AuraEnabled public String situacaoEmprestimo{get;set;}
        @AuraEnabled public Double numContratoSistemaAnterior{get;set;}
        @AuraEnabled public String codigoGrupoModalidade{get;set;}
        @AuraEnabled public Double percentualIOF{get;set;}
        @AuraEnabled public String indicativoConcessaoAtiva{get;set;}
    }
    
    //Emprestimos Simples - OpcaoPagamento
    public class opcoesPg {
        @AuraEnabled public Double valorEmprestimo{get;set;}
        @AuraEnabled public Double valorPrestacao{get;set;}
        @AuraEnabled public Integer prazo{get;set;}
        @AuraEnabled public Boolean error{get;set;}
        @AuraEnabled public String erro{get;set;}
    }
    
    //Protocolo - get Protocolo
    @AuraEnabled public List<Protocolo> protocolo;
    
    public class Protocolo{
        @AuraEnabled public String protocolo{get;set;}
        @AuraEnabled public Integer matricula{get;set;}
        @AuraEnabled public String cpf{get;set;}
        @AuraEnabled public String nome{get;set;}
        @AuraEnabled public Integer idAplicacao{get;set;}
        @AuraEnabled public String aplicacao{get;set;}
        @AuraEnabled public Integer idTransacao{get;set;}
        @AuraEnabled public String transacao{get;set;}
        @AuraEnabled public Integer idSituacao{get;set;}
        @AuraEnabled public String situacao{get;set;}
        @AuraEnabled public String dataProtocolo{get;set;}
        @AuraEnabled public String origem{get;set;}
    }
    
    //Start - Pensoes
    //pensoes-morte
    public class ConsultaPensaoMorte {
        @AuraEnabled public String dtAusen;
        @AuraEnabled public String vincPrevi;
        @AuraEnabled public String especiePrevi;
        @AuraEnabled public String dibPrevi;
        @AuraEnabled public String situacao;
        @AuraEnabled public String dtSituac;
        @AuraEnabled public Double percPrevi;
        @AuraEnabled public Double percInss;
        @AuraEnabled public String encBenef;
        @AuraEnabled public String enc13;
        @AuraEnabled public String cAlimen;
        @AuraEnabled public String espec;
        @AuraEnabled public String especieInss;
        @AuraEnabled public String dibInss;
        @AuraEnabled public Double rmi;
        @AuraEnabled public Double complPrevi;
        @AuraEnabled public Integer complAdicBb;
    }
    
    //historicos-bilhetes
    public class ConsultaHistoricoBilhete_Z {
        @AuraEnabled public List<ConsultaHistoricoBilhete> consulta_historico_bilhete;
        @AuraEnabled public String ant19112008;
    }
    
    public class ConsultaHistoricoBilhete {
        @AuraEnabled public String tipo;
        @AuraEnabled public String dataFopag;
        @AuraEnabled public String dataRecalculo;
        @AuraEnabled public String descricao;
    }
    
    //historicos-bases
    public class ConsultaAposeHistBase {
        @AuraEnabled public String dataCompetencia;
        @AuraEnabled public String dataFopag;
        @AuraEnabled public Double valorInss;
        @AuraEnabled public Double complPrevi;
        @AuraEnabled public Double total;
    }
    
    //grupos-familiar
    public class GruposFamiliar {
        @AuraEnabled public Integer grupo;
        @AuraEnabled public Integer seqGrupo;
        @AuraEnabled public Integer seqBenef;
        @AuraEnabled public String situacao;
    }
    
    //pensionistas
    public class CalcularPensionista {
        @AuraEnabled public Integer grupo;
        @AuraEnabled public String dtInic;
        @AuraEnabled public String dtRequer;
        @AuraEnabled public Integer idPensionista;
        @AuraEnabled public String situac;
        @AuraEnabled public String dtSituac;
        @AuraEnabled public String observacao;
        @AuraEnabled public String numInss;
        @AuraEnabled public String represLegal;
        @AuraEnabled public String nome;
        @AuraEnabled public String sexo;
        @AuraEnabled public String estCiv;
        @AuraEnabled public String dtNasc;
        @AuraEnabled public String invalidez;
        @AuraEnabled public String titular;
        @AuraEnabled public String cpf;
        @AuraEnabled public String dtInicPrevi;
        @AuraEnabled public String dtInicInss;
        @AuraEnabled public String dtInicCassi;
        @AuraEnabled public String situacao;
        @AuraEnabled public String dtSituacao;
        @AuraEnabled public String motivoSituac;
        @AuraEnabled public String vinculo;
        @AuraEnabled public String suspensaoDataPrevi;
        @AuraEnabled public String cotaResguardadaPrevi;
        @AuraEnabled public String cotaResguardadaInss;
        @AuraEnabled public Double percPrevi;
        @AuraEnabled public Double percInss;
        @AuraEnabled public String fontePgtoPrevi;
        @AuraEnabled public String fontePgtoInss;
        @AuraEnabled public String fontePgtoBB;
    }
    
    //representantes-legal
    public class RecalcPensaoIndividual {
        @AuraEnabled public Long cpf;
        @AuraEnabled public String nome;
        @AuraEnabled public String endereco;
        @AuraEnabled public Integer cep;
        @AuraEnabled public String bairro;
        @AuraEnabled public String municipio;
        @AuraEnabled public String uf;
        @AuraEnabled public String email;
        @AuraEnabled public String celular;
        @AuraEnabled public String ddd;
        @AuraEnabled public String telefone;
        @AuraEnabled public String vigenciaIni;
        @AuraEnabled public String vigenciaFim;
        @AuraEnabled public String capacCivil;
        @AuraEnabled public Integer tipoDoc;
    }
    
    //historicos
    public class HistoricoPensaoMorte {
        @AuraEnabled public String dataInicio;
        @AuraEnabled public String dataFim;
        @AuraEnabled public Double inssPercent;
        @AuraEnabled public Double previPercent;
        @AuraEnabled public String bb;
        @AuraEnabled public String inss;
        @AuraEnabled public String previ;
    }
    
    //complemento-pensao
    public class ConsultaCompleMorte {
        @AuraEnabled public String dtAusen;
        @AuraEnabled public String vincPrevi;
        @AuraEnabled public String especiePrevi;
        @AuraEnabled public String dibPrevi;
        @AuraEnabled public String situacao;
        @AuraEnabled public String dtSituac;
        @AuraEnabled public Double percPrevi;
        @AuraEnabled public Double percInss;
        @AuraEnabled public String encBenef;
        @AuraEnabled public String enc13;
        @AuraEnabled public String espec;
        @AuraEnabled public String especieInss;
        @AuraEnabled public String dibInss;
        @AuraEnabled public String dibInssAnt;
        @AuraEnabled public Double rmi;
        @AuraEnabled public Double complPrevi;
        @AuraEnabled public Double complAdicBb;
    }
    
    public class PendenciaDocumentos {
        @AuraEnabled public String descricao_doc;
        @AuraEnabled public String data_cadastro;
    }
    
    public class Recadastramento {
        @AuraEnabled public Integer idParticipante;
        @AuraEnabled public String tipo;
        @AuraEnabled public String descricao;
        @AuraEnabled public String limitePrimeiraCarta;
        @AuraEnabled public String limiteSegundaCarta;
        @AuraEnabled public Integer ano;
        @AuraEnabled public String observacoes;
        @AuraEnabled public String dataRetorno;
    }
    
    public class ConcessaoInssPrisma_Z {
        @AuraEnabled public String data;
        @AuraEnabled public String descricao;
    }
    
    public class ConcessaoInssPrisma{
        @AuraEnabled public List<ConcessaoInssPrisma_Z> concessao_inss_prisma;
        @AuraEnabled public String tipoBenef;
        @AuraEnabled public Integer especieNb;
        @AuraEnabled public String num_beneficio;
        @AuraEnabled public String dib;
        @AuraEnabled public String nome;
        @AuraEnabled public Integer cpf;
        @AuraEnabled public Integer dv;
        @AuraEnabled public Integer vinculo;
        @AuraEnabled public String sexo;
        @AuraEnabled public String dataNasc;
        @AuraEnabled public String tit;
        @AuraEnabled public String inv;
        @AuraEnabled public String rl;
        @AuraEnabled public String endereco;
        @AuraEnabled public String numero;
        @AuraEnabled public String complemento;
        @AuraEnabled public String bairro;
        @AuraEnabled public String municipio;
        @AuraEnabled public String cep;
        @AuraEnabled public String complCep;
        @AuraEnabled public String uf;
        @AuraEnabled public String dd1;
        @AuraEnabled public String dd2;
        @AuraEnabled public String dd3;
        @AuraEnabled public Integer tel1;
        @AuraEnabled public Integer tel2;
        @AuraEnabled public Integer tel3;
        @AuraEnabled public String email;
    }
    
    public class ConsultaHistAdiantamento {
        @AuraEnabled public String fopag;
        @AuraEnabled public Double valorEspelho;
        @AuraEnabled public String dtCredito;
        @AuraEnabled public Double valorPrevi;
        @AuraEnabled public Double valorInss;
        @AuraEnabled public String lancConfirmado;
        @AuraEnabled public String tipoBeneficio;
        @AuraEnabled public String nome;
        @AuraEnabled public Integer agencia;
        @AuraEnabled public Integer contaCorrente;
        @AuraEnabled public Double valPreviLiq;
        @AuraEnabled public Double valInssLiq;
    }
    //End - Pensoes

    //Start - Senha
    public class Alteracoes {
		@AuraEnabled public String dataSolicitacao;
		@AuraEnabled public String dataInicio;
		@AuraEnabled public String dataFim;
		@AuraEnabled public String motivo;
	}

    public class Solicitacoes {
		@AuraEnabled public Integer idInclusao;
		@AuraEnabled public String dataInclusao;
		@AuraEnabled public Integer idUsuarioInclusao;
		@AuraEnabled public String nomeUsuarioInclusao;
		@AuraEnabled public String dataAutorizacao;
		@AuraEnabled public Integer idUsuarioAutorizacao;
		@AuraEnabled public String nomeUsuarioAutorizacao;
		@AuraEnabled public String indAlteracaoConcluida;
	}
    //End - Senha

    //FI - get Contratos
    public class Contrato{
        @AuraEnabled public String Contrato{get;set;}  
        @AuraEnabled public String Contrato_com_Impedimento{get;set;}
        @AuraEnabled public String Contrato_em_Condominio{get;set;}
    }

    //FI - get Dados Financiamento
    public class DadosFinanciamento{
        @AuraEnabled public String idContrato{get;set;}
        @AuraEnabled public String situacaoContrato{get;set;}
        @AuraEnabled public String dscPlanoFincto{get;set;}
        @AuraEnabled public String escrit{get;set;}
        @AuraEnabled public Double quantidadeTotalPrestacoes{get;set;}
        @AuraEnabled public Integer intQntTotPrest{get;set;}
        @AuraEnabled public Double quantidadePrestacoesRestantes{get;set;}
        @AuraEnabled public Integer intQntPrestRest{get;set;}
        @AuraEnabled public Double valorPrestacao{get;set;}
        @AuraEnabled public String prestacoesInadimplentes{get;set;}
        @AuraEnabled public String comprometimentoRenda{get;set;}
        @AuraEnabled public String dataUltimoReajuste{get;set;}
        @AuraEnabled public Double valorFinanciamento{get;set;}
        @AuraEnabled public Double saldoDevedor{get;set;}
        @AuraEnabled public Double valorSaldoLiquidacao{get;set;}
        @AuraEnabled public Double taxaJuros{get;set;}
        @AuraEnabled public Double taxaMensalFundoLiquidez{get;set;}
        @AuraEnabled public Double taxaMensalFundoQuitacaoMorte{get;set;}
        @AuraEnabled public String dataAlteracaoTqm{get;set;}
        @AuraEnabled public Double taxaAdministracao{get;set;}
        @AuraEnabled public String tipoLogradouro{get;set;}
        @AuraEnabled public String logradouro{get;set;}
        @AuraEnabled public String numero{get;set;}
        @AuraEnabled public String complemento{get;set;}
        @AuraEnabled public String bairro{get;set;}
        @AuraEnabled public String cep{get;set;}
        @AuraEnabled public String cidade{get;set;}
        @AuraEnabled public String siglaEstado{get;set;}
    }

    //FI - get Devedores-solidarios
    
    public class DevedoresSolidarios{
        @AuraEnabled public String codigo_devedor{get;set;}
        @AuraEnabled public String nom_pessoa{get;set;}
    }

    //FI - get Liquidacoes
    public class Liquidacoes{
        @AuraEnabled public String tipo_liqd{get;set;}
        @AuraEnabled public String data_liqd{get;set;}
        @AuraEnabled public String data_baixa{get;set;}
    }

    //FI - get Impedimentos
    public class Impedimentos{
        @AuraEnabled public String tipo_impdto{get;set;}
        @AuraEnabled public String justificativa{get;set;}
        @AuraEnabled public String inicio_Vigencia{get;set;}
        @AuraEnabled public String fim_Vigencia{get;set;}
    }

    //FI - get Anotações
    public class AnotacoesFI{
        @AuraEnabled public String dsc_anotac_cfi{get;set;}
        @AuraEnabled public String dscResume{get;set;}
        @AuraEnabled public String dat_incl{get;set;}
    }

    //FI - get Condominos
    public class Condominos{
        @AuraEnabled public String mat_condom{get;set;}
        @AuraEnabled public String nome_condom{get;set;}
        @AuraEnabled public String ctr_condom{get;set;}
        @AuraEnabled public String financ{get;set;}
        @AuraEnabled public CondominosSit sit{get;set;}
    }
    public class CondominosSit{
        @AuraEnabled public String ctr{get;set;}
    }

    //FI - get Seguros
    public class Seguros{
        @AuraEnabled public List<ConsultaSeguro> consulta_seguro{get;set;}
        @AuraEnabled public String seguradora{get;set;}
        @AuraEnabled public String val_seguro{get;set;}
        @AuraEnabled public String dat_inic_vigenc{get;set;}
        @AuraEnabled public String dat_fim_vigenc{get;set;}
    }
    public class ConsultaSeguro{
        @AuraEnabled public String tp_cob_segurada{get;set;}
        @AuraEnabled public String val_cobert{get;set;}
    }

    //FI - get Cobrancas
    public class CobrancasFI{
        @AuraEnabled public String tipo_movim{get;set;}
        @AuraEnabled public String dat_evento{get;set;}
        @AuraEnabled public String val_total_movim{get;set;}
        @AuraEnabled public String val_saldo_recebe{get;set;}
    }

    //FI - get Extrato1
    public class ExtratoFI{
        @AuraEnabled public String dataEvento{get;set;}
        @AuraEnabled public String dataCompetencia{get;set;}
        @AuraEnabled public String numeroPrestacoes{get;set;}
        @AuraEnabled public String tipoMovimentoCFI{get;set;}
        @AuraEnabled public String percentualIndiceUtilizado{get;set;}
        @AuraEnabled public String valorCorrecaoMonetaria{get;set;}
        @AuraEnabled public String valorJuros{get;set;}
        @AuraEnabled public String valorFL{get;set;}
        @AuraEnabled public String valorFQM{get;set;}
        @AuraEnabled public String valorEvento{get;set;}
        @AuraEnabled public String balanco{get;set;}
    }

    //FI - get Atrasos
    public class Atrasos{
        @AuraEnabled public String dat_venc{get;set;}
        @AuraEnabled public String tipo_mov{get;set;}
        @AuraEnabled public String val_saldo{get;set;}
        @AuraEnabled public String val_corrigido{get;set;}
    }

    //FI - get Devolucoes
    public class Devolucoes{
        @AuraEnabled public String contrato{get;set;}
        @AuraEnabled public String tipo{get;set;}
        @AuraEnabled public String status{get;set;}
        @AuraEnabled public String data{get;set;}
        @AuraEnabled public String valor_prev{get;set;}
        @AuraEnabled public String forma_devolucao{get;set;}
        @AuraEnabled public String data_real_devolucao{get;set;}
        @AuraEnabled public String valor_total_original{get;set;}
        @AuraEnabled public String valor_cm{get;set;}
        @AuraEnabled public String valor_juros{get;set;}
        @AuraEnabled public String val_fqm{get;set;}
        @AuraEnabled public String val_tot_dev{get;set;}
    }

    //FI - get Vendedores
    public class Vendedores{
        @AuraEnabled public String qtd_vend{get;set;}
        @AuraEnabled public String val_cred_vend{get;set;}
        @AuraEnabled public String dat_cred_vend{get;set;}
    }

    //FI - get Credito-Sinal
    public class CreditoSinal{
        @AuraEnabled public String dat_cred_sinal{get;set;}
        @AuraEnabled public String val_cred_sinal{get;set;}
    }

    //FI - get FGTS
    public class Fgts{
        @AuraEnabled public String val_fgts{get;set;}
        @AuraEnabled public String dat_fgts{get;set;}
    }

    //FI - get Carta
    public class Carta{
        @AuraEnabled public String dataConvocacao{get;set;}
        @AuraEnabled public String pessoa{get;set;}
        @AuraEnabled public String dataLimiteProposta{get;set;}
        @AuraEnabled public String dataManifestacao{get;set;}
        @AuraEnabled public String valorMaximoPrestacao{get;set;}
        @AuraEnabled public String quantidadePrestacoesMax{get;set;}
        @AuraEnabled public String valorMaximoFimanciamento{get;set;}
    }

    //FI - gettipo Impedimento
    public class HistoricoImpedimentos{
        @AuraEnabled public String dat_hist_val_impdto{get;set;}
        @AuraEnabled public String tipo_impedimento{get;set;}
    }

    //FI - get Historicos-valores-classificacacoes
    public class HistValClassificacoes{
        @AuraEnabled public String data{get;set;}
        @AuraEnabled public String valormaximoprestacao{get;set;}
        @AuraEnabled public String prazomaxfinanciamento{get;set;}
        @AuraEnabled public String valormaximofinanciamento{get;set;}
    }
}