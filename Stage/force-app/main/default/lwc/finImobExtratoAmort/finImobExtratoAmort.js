import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getExtrato from '@salesforce/apex/FinImobController.getExtrato';
import getCobrancasExtrato from '@salesforce/apex/FinImobController.getCobrancasExtrato';

export default class FinImobExtratoAmort extends LightningElement {
    @api idContrato
    @api matricula

    listExtrato = [];
    listCobrancas = [];

    connectedCallback() {
        console.log('Entrou FinImobSeguroTax');
        this.loadingExtratoAmort();
    }

    loadingExtratoAmort(){
        console.log('Entrou loadingExtratoAmort com a matricula >>' + this.matricula);
        getExtrato({ matricula: this.matricula, idContrato: this.idContrato})
            .then(result => {
                console.log('RESULT getExtrato>> ' + JSON.stringify(result));
                if (result) {
                    let returnExtrato = [];
                    result.forEach(rec => { 
                        let record = {};
                        record.dataEvento = rec.dataEvento;
                        record.dataCompetencia = rec.dataCompetencia;
                        record.numeroPrestacoes = rec.numeroPrestacoes;
                        record.tipoMovimentoCFI = rec.tipoMovimentoCFI;
                        record.percentualIndiceUtilizado = rec.percentualIndiceUtilizado;
                        record.valorCorrecaoMonetaria = rec.valorCorrecaoMonetaria;
                        record.valorJuros = rec.valorJuros;
                        record.valorFL = rec.valorFL;
                        record.valorFQM = rec.valorFQM;
                        record.valorEvento = rec.valorEvento;
                        record.balanco = rec.balanco;

                        returnExtrato.push(record);
                    })
                    
                    this.listExtrato = returnExtrato;
                } else {
                    this.texto = 'Não há Seguros';
                }
                this.loading = false;
            })
            .catch(error => {
                this.loading = false;
                console.log('error ', error);
                this.showNotification('ERRO', error, 'error', 'sticky');
            });

        getCobrancasExtrato({ matricula: this.matricula, idContrato: this.idContrato})
            .then(result => {
                console.log('RESULT getCobrancasExtrato>> ' + JSON.stringify(result));
                if (result) {                    
                    this.listCobrancas = result;
                } else {
                    this.texto = 'Não há Cobranças';
                }
                this.loading = false;
            })
            .catch(error => {
                this.loading = false;
                console.log('error ', error);
                this.showNotification('ERRO', error, 'error', 'sticky');
            });
    }

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