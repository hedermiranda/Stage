import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


import getRenegociacoes from '@salesforce/apex/IntegrationESController.getRenegociacoes';


export default class TabConsuReneg extends LightningElement {
    
    @api matricula;
    @track renegList = [];
    loading = true; 


    /**
    * Inicializa a Página carregando os campos com retono da API de renegociação.
    */
    connectedCallback() {
        this.carregandoRenegList();
    }


    /**
    * Chamado no onclick do button-icone 
    */
    handleChange(event) {
        let value = event.target.accessKey;
        let listaux = [];
        for (let i in this.renegList) {
            if (i == value) {
                this.renegList[i]["areDetailsVisible"] = !this.renegList[i]["areDetailsVisible"];
            }
            listaux.push(this.renegList[i]);
        }
        this.renegList = listaux;
    }



    carregandoRenegList() {
        let auxList = [];
        getRenegociacoes({ matricula: this.matricula})
       // getRenegociacoes({ matricula: '5255490' })  
            .then(result => {
                auxList = result;
                if (auxList != null && auxList.length > 0) {
                    for (var key in auxList) {
                        this.renegList.push({
                            idPropost : auxList[key].id_proposta_renegc,
                            numEmprestimo: auxList[key].numEmprestimo,
                            modalidade: auxList[key].modalidade,
                            status: auxList[key].status,
                            dataRenegociacao: auxList[key].dataRenegociacao,
                            cancelable: auxList[key].cancelavel === false ? 'N' : 'S',   
                            protocoloCadas: auxList[key].protocoloCadas,
                            protocoloCancel: auxList[key].protocoloCancel,
                            saldoDevedor: auxList[key].saldoDevedor,
                            dataImplantacao: auxList[key].dataImplantacao,
                            prestacaoAnt: auxList[key].prestacaoAnt,
                            qtdPrestRestante: auxList[key].qtdPrestRestante,
                            qtdPrestPagas: auxList[key].qtdPrestPagas, 
                            qtdPrestCobradas: auxList[key].qtdPrestCobradas,
                            valorPrestacao: auxList[key].valorPrestacao,
                            prestacoesRestantes: auxList[key].prestacoesRestantes,
                        });
                    }
                    //console.log('auxList  ' + JSON.stringify(auxList));
                } else {
                    this.renegList.push({
                        idPropost: '',
                        numEmprestimo: '',
                        modalidade: '',
                        status: '',
                        dataRenegociacao: '',
                        cancelable: '',
                        protocoloCadas: '',
                        protocoloCancel: '',
                        saldoDevedor: '',
                        dataImplantacao: '',
                        prestacaoAnt: '',
                        qtdPrestRestante: '',
                        qtdPrestPagas: '',
                        qtdPrestCobradas: '',
                        valorPrestacao: '',
                        prestacoesRestantes: '',
                    });
                    this.showNotification('ATENÇÃO!', 'Não há RENEGOCIAÇÔES para essa Matricula', 'warning', 'dismissible');
                }
                this.loading = false;

            })
            .catch(error => {
                console.log('error', error);
                this.showNotification('ERRO', error, 'error', 'sticky');
            });

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