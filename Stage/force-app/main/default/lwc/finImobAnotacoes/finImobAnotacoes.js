import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAnotacoes from '@salesforce/apex/FinImobController.getAnotacoes';

export default class FinImobAnotacoes extends LightningElement {
    @api idContrato
    @api matricula

    anotacoes = [];

    connectedCallback() {
        console.log('Entrou FinImobAnotacoes');
        this.loadingAnotacoes();
    }

    loadingAnotacoes(){
        console.log('Entrou loadingAnotacoes com a matricula >>' + this.matricula);
        getAnotacoes({ matricula: this.matricula, idContrato: this.idContrato})
            .then(result => {
                console.log('RESULT getAnotacoes>> ' + JSON.stringify(result));
                if (result) {                    
                    this.anotacoes = result;
                } else {
                    this.texto = 'Não há Anotacoes';
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

    openAnotacoes(){
        this.modalAnotacoes = true;
    }

    closeAnotacoes() {
        this.modalAnotacoes = false;  
    }
}