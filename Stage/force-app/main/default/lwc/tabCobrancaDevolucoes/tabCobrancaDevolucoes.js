import { LightningElement, api, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getCobranca from '@salesforce/apex/IntegrationESController.getCobranca';
import getDevolucoes from '@salesforce/apex/IntegrationESController.getDevolucoes';



export default class TabCobrancaDevolucoes extends LightningElement {


    @api propostList = [];
    @api matricula;
    @track cobrancaList = [];
    @track devolucaoList = [];
    fieldsInfo = [];
    @track treeItems;
    @track devolucoes;
    @track error;
    obj;
    value;
    idEmprestimo;
    listDadosColuna = [];
    listAux = [];
    loaded = false;
    isTableDados = false;
    areDetailsVisible = false;
    listRemessas = [];
    listRemessa = [];
    isDisabled = false;
    mapRemessas = new Map();
   


    /**
    * Inicializa a Página carregando o combobox com os valores da lista de proposta, herança do componente pai -c/emprestimoSimples.
    */
    connectedCallback() {
        //console.log('propostList Cobrnca e devolucao ' + JSON.stringify(this.propostList));
        //console.log('matricula ' + JSON.stringify(this.matricula));
        this.PropMod;
    }

    /**
    * Chamado no onclick do button-icone 
    */
    handleChange(event) {
        let value = event.target.accessKey;
        let listaux = [];
        for (let i in this.treeItems) {
            this.treeItems[i]["isDisabled"] = !this.treeItems[i]["isDisabled"];
            if (i == value) {
                this.treeItems[i]["areDetailsVisible"] = !this.treeItems[i]["areDetailsVisible"];
                this.treeItems[i]["isDisabled"] = false;
                if (this.mapRemessas.has(this.treeItems[i]["cobranca"])) {
                    this.listRemessas = this.mapRemessas.get(this.treeItems[i]["cobranca"]);
                }
            }
            listaux.push(this.treeItems[i]);
        }
        this.treeItems = listaux;
    }

    /**
    * Chamado no connectedCallback 
    */
    get PropMod() {
        if (this.propostList != null) {
            for (var key in this.propostList) {
                //console.log('this.obj ' + JSON.stringify({ label: this.propostList[key].id, value: this.propostList[key].id }));
                this.obj = { label: this.propostList[key].id + ' & ' + this.propostList[key].modalidade, value: this.propostList[key].id + ' & ' + this.propostList[key].modalidade };
                this.fieldsInfo.push(this.obj);
            }
        }
    }

/**
 * Chamado no onchange do combobox para carregar os dados da tabela com base em duas API's cadastro e Devoluções.
 */
    carregandoListCobranca(event) {
        this.loaded = true;
        this.value = event.detail.value;
        let index = this.value.indexOf('&');
        this.idEmprestimo = this.value.substring(0, index).trim();
        this.listDadosColuna = [];
        this.listDadosColunaDev = [];
        this.listAux = [];
        this.devolucoes= [];
        getCobranca({ matricula: this.matricula, idEmprestimo: this.idEmprestimo })
        //getCobranca({ matricula: '743255', idEmprestimo: '2691959' })   
            .then(result => {
            
                if (result != null){
                    this.cobrancaList = result;
                //console.log('cobrancaList  carregandoListCobranca ' + JSON.stringify(this.cobrancaList));
                }else{
                    this.showNotification('ATENÇÃO!', 'Não há COBRANÇA para essa Matricula e Identificador de Empréstimo! ', 'warning', 'dismissible');
                }
                this.carregandoListDevolucao();
            })
            .catch(error => {
                console.log('error', error);
                this.showNotification('ERRO', error, 'error', 'sticky');
            });

    }


    carregandoListDevolucao() {
        getDevolucoes({ matricula: this.matricula, idEmprestimo: this.idEmprestimo })
        //getDevolucoes({ matricula: '7499010', idEmprestimo: '341826' })
            .then(result => {
                if (result != null) {
                this.devolucaoList = result;
                //console.log('devolucaoList carregandoListDevolucao ' + JSON.stringify(this.devolucaoList));
                }else{
                    this.showNotification('ATENÇÃO!', 'Não há DEVOLUÇÃO para essa Matricula e Identificador de Empréstimo! ', 'warning', 'dismissible');
                }
                this.montandoTable();
            })
            .catch(error => {
                console.log('error', error);
                this.showNotification('ERRO', error, 'error', 'sticky');
            });
    }

  
  
    montandoTable() {
        //console.log('cobrancaList montandoTable ' + JSON.stringify(this.cobrancaList));
        //console.log('devolucaoList  montandoTable' + JSON.stringify(this.devolucaoList));
        let listaux = [];
        if (this.cobrancaList.length != 0) {
            for (var item = 0; item < this.cobrancaList.length; item++) {

                this.listDadosColuna.push({
                    tipoMovimento: this.cobrancaList[item].tipoMovimento,
                    numeroPrestacao: this.cobrancaList[item].numeroPrestacao,
                    dataVencimento: this.cobrancaList[item].dataVencimento,
                    dataCompetencia: this.cobrancaList[item].dataCompetencia,
                    valorPrestacao: this.cobrancaList[item].valorPrestacao,
                    tipoSusp: this.cobrancaList[item].tipoSuspen,
                    st: this.cobrancaList[item].status,
                    cobranca: this.cobrancaList[item].cobranca,
                    id: item + 1
                });
                if (this.cobrancaList[item].remessas.length > 0){
                    listaux = this.cobrancaList[item].remessas; 
                    for (var key in listaux){
                        this.listRemessa.push({
                            cobr: listaux[key].cobr,
                            dataCancel: listaux[key].dataCancel,
                            dataRealEnv: listaux[key].dataRealEnv,
                            dataRetorno: listaux[key].dataRetorno,
                            descRetorno: listaux[key].descRetorno,
                            pago: listaux[key].pago,
                            valCobrado: listaux[key].valCobrado,
                        });
                        this.mapRemessas.set(this.cobrancaList[item].cobranca, this.cobrancaList[item].remessas); 
                    }


                } else{
                    this.listRemessa.push({
                        cobr: '',
                        dataCancel: '',
                        dataRealEnv: '',
                        dataRetorno: '',
                        descRetorno: '',
                        pago: '',
                        valCobrado: '',
                    });
                    this.mapRemessas.set(this.cobrancaList[item].cobranca, this.listRemessa); 

                }          
            }
        } else {
            this.showNotification('ATENÇÃO!', 'Não há COBRANÇA para essa Matricula e Identificador de Empréstimo! ', 'warning', 'dismissible');
            
            //mock para caso não haja nenhuma cobrança para exibir os campos null
            this.listDadosColuna.push({
                dtVenc: '',
                dtCompet: '',
                valPrest: '',
                tipoSusp: '',
                st: '',
                id: '',
                cobr: '',
                dataCancel: '',
                dataRealEnv: '',
                dataRetorno: '',
                descrRet: '',
                pg: '',
                valCobrado: '',
            });
        }

        if (this.devolucaoList.length != 0) {
            for (var devo = 0; devo < this.devolucaoList.length; devo++) {
                this.listAux.push({
                    dtEvento: this.devolucaoList[devo].dtEvento,
                    valorOrigem: this.devolucaoList[devo].valorOrigem,
                    dtReal: this.devolucaoList[devo].dtReal,
                    valorReal: this.devolucaoList[devo].valorReal,
                    status: this.devolucaoList[devo].status,
                    forma: this.devolucaoList[devo].forma,
                });
            }
        } else {
            this.showNotification('ATENÇÃO!', 'Não há DEVOLUÇÃO para essa Matricula e Identificador de Empréstimo! ', 'warning', 'dismissible');
            //mock para caso não haja nenhuma devolução para exibir os campos null
            this.listAux.push({
                dtEvento: '',
                valorOrigem: '',
                dtReal: '',
                valorReal: '',
                status: '',
                forma: '',
            });
        }

        //console.log('depois child  ' + JSON.stringify(this.listDadosColuna));
        this.treeItems = this.listDadosColuna;
        this.devolucoes = this.listAux;
        this.loaded = false;
        this.isTableDados = true;
        //console.log('treeItems -->' + JSON.stringify(this.treeItems));
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