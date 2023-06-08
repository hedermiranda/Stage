import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAtrasos from '@salesforce/apex/FinImobController.getAtrasos';

export default class FinImobPrestAtraso extends LightningElement {
    @api idContrato
    @api matricula

    listPrestAtraso = [];

    connectedCallback() {
        console.log('Entrou FinImobPrestAtraso');
        this.loadingPrestAtraso();
    }

    loadingPrestAtraso(){
        console.log('Entrou loadingPrestAtraso com a matricula >>' + this.matricula);
        getAtrasos({ matricula: this.matricula, idContrato: this.idContrato})
            .then(result => {
                console.log('RESULT getAtrasos>> ' + JSON.stringify(result));
                if (result) {                    
                    this.listPrestAtraso = result;
                } else {
                    this.texto = 'Não há Prestação em Atraso';
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