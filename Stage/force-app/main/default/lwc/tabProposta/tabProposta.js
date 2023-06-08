import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import getExtrato from '@salesforce/apex/IntegrationESController.getExtrato';
import getEmprestimos from '@salesforce/apex/IntegrationESController.getEmprestimos';
import carregandoTabProposta from '@salesforce/apex/IntegrationESController.carregandoTabProposta';






export default class TabProposta extends LightningElement {

    @api propostList = [];
    @api matricula;
    @api listAnotacao = [];

    empList = [];
    @track ExtratObj = {
        posicao: '',
        saldoDevedor: '',
        PrestacaoAtual: '',
        qtdPrestacoesIniciais: '',
        prazoRestante: '',
        qtdPrestacoesCobradas: '',
        qtdPrestacoesPagas: '',
    };
    loaded = true;
    listEmp = [];
    listNotEmp = [];
    listIdEmp = [];
    @track listTableAll = [];
    @track listbackup = [];
    isDisabled = false;
    mapBackupExtrato = new Map();
    isDetalhe = false;
    loadedProp = true;
    loadPreview = true;
    sizeRecords = 0;
    listAnotacaoAux = [];


    /**
    * Inicializa a Página chamando os API's de Anotação e Emprestimo.
    */

    connectedCallback() {
        this.carregandoListAnot();
        this.carregando();
    }

    /**
    * Carregando o combobox.
    */
    value = 'Todas';

    get options() {
        return [
            { label: 'Cadastradas', value: 'cadas' },
            { label: 'Creditadas', value: 'cred' },
            { label: 'Liquidadas FI', value: 'Liq. FI' },
            { label: 'Canceladas', value: 'canc' },
            { label: 'Todas', value: 'Todas' },
        ];
    }

    /**
    * Chamado no onchange do combobox para filtrar as propostas.
    */
    statusNovo(event) {
        this.value = event.detail.value;
        this.listTableAll = [];
        let listaux = [];
        //console.log('this.listbackup ' + JSON.stringify(this.listbackup));
        for (var key in this.listbackup) {
            if (this.value == this.listbackup[key].situacaoProposta.toLowerCase()) {
                listaux.push({
                    id: this.listbackup[key].id,
                    modalidade: this.listbackup[key].modalidade,
                    valorSolicitado: this.listbackup[key].valorSolicitado,
                    dataPrevistaCredito: this.listbackup[key].dataPrevistaCredito,
                    situacaoProposta: this.listbackup[key].situacaoProposta,
                    dataSolicitacao: this.listbackup[key].dataSolicitacao,
                    valorTaxaAdmin: this.listbackup[key].valorTaxaAdmin,
                    valorIOF: this.listbackup[key].valorIOF,
                    valFQM: this.listbackup[key].valFQM,
                    valorCredito: this.listbackup[key].valorCredito,
                    protocoloCadas: this.listbackup[key].protocoloCadas,
                    protocoloCancel: this.listbackup[key].protocoloCancel,
                    ESLiquidado: this.listbackup[key].ESLiquidado,
                    verbasPAS: this.listbackup[key].verbasPAS,
                    valDivFinancImob: this.listbackup[key].valDivFinancImob,
                    valDivPrevi: this.listbackup[key].valDivPrevi,
                    agenciaCreditada: this.listbackup[key].agenciaCreditada,
                    contaCreditada: this.listbackup[key].contaCreditada,
                    indOrigemPropos: this.listbackup[key].indOrigemPropos,
                    dataPrevistaFimEmprestimo: this.listbackup[key].dataPrevistaFimEmprestimo,
                    dataSaldoDevedor: this.listbackup[key].dataSaldoDevedor,
                    valorSaldoDevedorAtual: this.listbackup[key].valorSaldoDevedorAtual,
                    indicativoEmprestimoProposta: this.listbackup[key].indicativoEmprestimoProposta,
                    qtdPrestacoesInadimpConsecutivas: this.listbackup[key].qtdPrestacoesInadimpConsecutivas,
                });
            }
        }
        this.listTableAll = listaux;
        if (this.value == 'Todas') {
            this.listTableAll = this.listbackup;
        }
        this.sizeRecords = this.listTableAll.length;
    }


    carregandoListAnot() {
        let auxList = [];
        if (this.listAnotacao != null && this.listAnotacao.length > 0) {
            auxList = this.listAnotacao;
            for (var item = 0; item < auxList.length; item++) {

                this.listAnotacaoAux.push({
                    descricaoAnotacao: auxList[item].descricaoAnotacao,
                    dataInclusao: auxList[item].dataInclusao.substring(0, 10),
                    id: item + 1,
                });
            }
            this.loaded = false;
            //console.log('listAnotacao ' + JSON.stringify(this.listAnotacao));
        } else {
            this.listAnotacaoAux.push({
                descricaoAnotacao: '',
                dataInclusao: '',
            });
            this.showNotification('ATENÇÃO!', 'Não há ANOTAÇÃO para essa matrícula ! ', 'warning', 'dismissible');
            this.loaded = false;
        }
    
    }


    carregandoListExtrato(matricula, idEmprestimo) {
        //getExtrato({ matricula: this.matricula, idEmprestimo: this.idEmprestimo })
        getExtrato({ matricula: matricula, idEmprestimo: idEmprestimo })
            .then(result => {
                //console.log('extList result' + JSON.stringify(result));

                if (result != null && result.erro == null) {
                    this.ExtratObj = {
                        posicao: result.posicao,
                        saldoDevedor: result.saldoDevedor,
                        prestacaoAtual: result.prestacaoAtual,
                        qtdPrestacoesIniciais: result.qtdPrestacoesIniciais,
                        prazoRestante: result.prazoRestante,
                        qtdPrestacoesCobradas: result.qtdPrestacoesCobradas,
                        qtdPrestacoesPagas: result.qtdPrestacoesPagas,
                    };

                    this.mapBackupExtrato.set(idEmprestimo, this.ExtratObj);
                    //console.log('listTableAll extList ' + JSON.stringify(this.mapackupExtrato));
                }

            })
            .catch(error => {
                console.log('error ', error);
                this.showNotification('ERRO EXTRATO', error, 'error', 'dismissible');
            });
    }

    /**
    * Montando a tabela com retornos das API's e se erro/vazio mockar com branco para exibir os campos.
    */
  async  carregando() {
        let propostaStr = JSON.stringify(this.propostList);

       await carregandoTabProposta({ matricula: this.matricula, listPropostas: propostaStr })
            .then(result => {
                console.log('novo met ' + JSON.stringify(result));

                if (result != null && (result.erro == false || result.erro == undefined)) {
                    this.listTableAll = result;
                } else{
                    this.showNotification('ERRO ', 'API', 'error', 'dismissible');  
                }

                this.listbackup = this.listTableAll;
                this.loadedProp = false;
                this.sizeRecords = this.listTableAll.length;

            })
            .catch(error => {
                console.log('error ', error);
                this.showNotification('ERRO', error, 'error', 'dismissible');
            });
    }




    /**
    * Chamado no onclick do button-icone  e verifica se já foi chamado anteriormente se sim reutiliza a lista carregada na chamada anterior.
    */
    handleChange(event) {
        let value = event.target.accessKey;
        let listaux = [];
        for (let i in this.listTableAll) {
            this.listTableAll[i]["isDisabled"] = !this.listTableAll[i]["isDisabled"];
            if (i == value) {
                this.listTableAll[i]["areDetailsVisible"] = !this.listTableAll[i]["areDetailsVisible"];
                this.listTableAll[i]["isDisabled"] = false;
                if (this.mapBackupExtrato.has(this.listTableAll[i]["id"])) {
                    this.ExtratObj = this.mapBackupExtrato.get(this.listTableAll[i]["id"]);
                } else {
                    //this.carregandoListExtrato('6782051', this.listTableAll[i]["id"]);
                   this.carregandoListExtrato(this.matricula, this.listTableAll[i]["id"]);
                }
            }

            listaux.push(this.listTableAll[i]);
        }
       this.listTableAll = listaux;
        this.loadPreview = false;
    }


    /**
    * Exibe Toast onde variant- info,success,warning,error e mode- dismissible,pester,sticky.
    */
    showNotification(title, message, variant, mode) {
        const msg = {
            title: title,
            message: message,
            variant: variant,
            mode: mode
        };
        const evt = new ShowToastEvent(msg);
        this.dispatchEvent(evt);
    }

}