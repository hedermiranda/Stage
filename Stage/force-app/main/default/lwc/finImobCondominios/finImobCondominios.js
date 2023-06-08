import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getCondominos from '@salesforce/apex/FinImobController.getCondominos';

export default class FinImobCondominio extends LightningElement {
    @api idContrato
    @api matricula

    listCondominos = [];

    connectedCallback() {
        console.log('Entrou FinImobCondominio');
        this.loadingCondominos();
    }

    loadingCondominos(){
        console.log('Entrou loadingImpedimentos com a matricula >>' + this.matricula);
        getCondominos({ matricula: this.matricula, idContrato: this.idContrato})
            .then(result => {
                console.log('RESULT getCondominos>> ' + JSON.stringify(result));
                if (result) {
                    let returnCondominos = [];
                    result.forEach(rec => {
                        let record = {};
                        record.mat_condom = rec.mat_condom;
                        record.nome_condom = rec.nome_condom;
                        record.ctr_condom = rec.ctr_condom; 
                        record.financ = rec.financ;
                        record.sit = rec.sit;

                        returnCondominos.push(record);
                    })
                    
                    this.listCondominos = returnCondominos;
                } else {
                    this.texto = 'Não há Condomínio';
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