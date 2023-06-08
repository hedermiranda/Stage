import { LightningElement, track, api } from 'lwc';
import getExtract from '@salesforce/apex/IntegrationESController.getExtrato';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class TabExtrato extends LightningElement {

    @api propostList = [];
    @api matricula;
    loading = true;
    @track listProp = [];
    @track extractList = [];
    @track error;
    @track obj;
    mapBackupExtrato = new Map();
    isDisabled = false;
    @track extratObj = {
        dataEvento: '',
        tipoMovimento: '',
        correcao: '',
        juros: '',
        fqm: '',
        fl: '',
        valor: '',
        saldoDevedor: '',
        qtdDiasBase: '',
        prcIndiceCorrMonetBase: '',
    };

    /**
    * Montando a tabela com retornos das API's e se erro/vazio mockar com branco para exibir os campos.
    */
    verifyProp() {
        if (this.propostList != null && this.propostList.length > 0) {

            for (var key in this.propostList) {
                this.listProp.push({
                    id: this.propostList[key].id,
                    modalidade: this.propostList[key].modalidade,
                    posicao: this.propostList[key].posicaoES,
                });
            }
        } else {
            this.listProp.push({
                id: '',
                modalidade: '',
                posicao: '',
            });
            this.showNotification('ATENÇÃO!', 'Não há PROPOSTAS para essa matrícula ! ', 'warning', 'dismissible');
        }
        this.loading = false;
    }

    /**
    * Inicializa a Página montando a lista de proposta, herança do componente pai -c/emprestimoSimples.
    * 
    */
    connectedCallback() {
        this.verifyProp();
    }

    carregandoListExtrato(matricula, idEmprestimo) {
        getExtract({ matricula: matricula, idEmprestimo: idEmprestimo })
            .then(result => {
               // console.log('extList result' + JSON.stringify(result));

                if (result != null && result.erro == null) {
                    if (result.error == false || result.error == undefined) {
                        for (let i = 0; i < result.lancamentos.length; i++) {
                            this.extratObj = {
                                dataEvento: result.lancamentos[i].dataEvento,
                                tipoMovimento: result.lancamentos[i].tipoMovimento,
                                correcao: result.lancamentos[i].correcao,
                                juros: result.lancamentos[i].juros,
                                fqm: result.lancamentos[i].fqm,
                                fl: result.lancamentos[i].fl,
                                valor: result.lancamentos[i].valor,
                                saldoDevedor: result.lancamentos[i].saldoDevedor,
                                qtdDiasBase: result.lancamentos[i].qtdDiasBase,
                                prcIndiceCorrMonetBase: result.lancamentos[i].prcIndiceCorrMonetBase,
                            };
                        }
                        this.mapBackupExtrato.set(idEmprestimo, this.extratObj);
                       // console.log('extList ' + JSON.stringify(this.mapackupExtrato));
                    } else {
                        this.showNotification('ERRO', 'API EXTRATO', 'error', 'dismissible');
                    }
                } else {
                    this.showNotification('ATENÇÃO!', 'Não há Extrato para essa matrícula ! ', 'warning', 'dismissible');

                }

            })
            .catch(error => {
                console.log('error ', error);
                this.showNotification('HOUVE UM ERRO - EXTRATO', error, 'error', 'dismissible');
            });
    }


    /**
    * Chamado no onclick do button-icone  e verifica se já foi chamado anteriormente se sim reutiliza a lista carregada na chamada anterior.
    */
    handleChange(event) {
        let value = event.target.accessKey;
        let listaux = [];
        for (let i in this.listProp) {
            this.listProp[i]["isDisabled"] = !this.listProp[i]["isDisabled"];
            if (i == value) {
                this.listProp[i]["areDetailsVisible"] = !this.listProp[i]["areDetailsVisible"];
                this.listProp[i]["isDisabled"] = false;
                if (this.listProp[i]["isDisabled"] == false) {
                if (this.mapBackupExtrato.has(this.listProp[i]["id"])) {
                    this.ExtratObj = this.mapBackupExtrato.get(this.listProp[i]["id"]);
                } else {
                    //this.carregandoListExtrato('6782051', this.listProp[i]["id"]);
                    this.carregandoListExtrato(this.matricula, this.listProp[i]["id"]);
                    //console.log('matricula ' + this.matricula + ' id: ' + this.listProp[i]["id"]);
                }
            }
            }

            listaux.push(this.listProp[i]);
        }
        this.listProp = listaux;
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