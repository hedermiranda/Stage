import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getSeguros from '@salesforce/apex/FinImobController.getSeguros';
import getCobrancasSeguro from '@salesforce/apex/FinImobController.getCobrancasSeguro';

export default class FinImobSeguroTax extends LightningElement {
    @api idContrato
    @api matricula

    seguros = [];
    coberturas = [];
    listCobrancas = [];

    connectedCallback() {
        console.log('Entrou FinImobSeguroTax');
        this.loadingSegurosTax();
    }

    loadingSegurosTax(){
        console.log('Entrou loadingSegurosTax com a matricula >>' + this.matricula);
        getSeguros({ matricula: this.matricula, idContrato: this.idContrato})
            .then(result => {
                console.log('RESULT getSeguros>> ' + JSON.stringify(result));
                if (result) {

                    this.seguros = result;
                    this.coberturas = result.consulta_seguro;
                    console.log('this.coberturas >> ' + this.coberturas);
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

        getCobrancasSeguro({ matricula: this.matricula, idContrato: this.idContrato})
            .then(result => {
                console.log('RESULT getCobrancasSeguro>> ' + JSON.stringify(result));
                if (result) {
                    let returnCobrancas = [];
                    result.forEach(rec => { 
                        let record = {};
                        record.tipo_movim = rec.tipo_movim;
                        record.dat_evento = rec.dat_evento;
                        record.val_total_movim = rec.val_total_movim;
                        record.val_saldo_recebe = rec.val_saldo_recebe;

                        returnCobrancas.push(record);
                    })
                    
                    this.listCobrancas = returnCobrancas;
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