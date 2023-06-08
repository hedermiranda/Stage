import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getVendedores from '@salesforce/apex/FinImobController.getVendedores';
import getCreditoSinal from '@salesforce/apex/FinImobController.getCreditoSinal';
import getFgts from '@salesforce/apex/FinImobController.getFgts';

export default class FinImobDadosConcessao extends LightningElement {
    @api idContrato
    @api matricula

    vendedores = [];
    sinal = [];
    fgts = [];

    connectedCallback() {
        console.log('Entrou FinImobDadosConcessao');
        this.loadingDadosConcessao();
    }

    loadingDadosConcessao(){
        console.log('Entrou loadingDadosConcessao com a matricula >>' + this.matricula);
        getVendedores({ matricula: this.matricula, idContrato: this.idContrato})
            .then(result => {
                console.log('RESULT getVendedores>> ' + JSON.stringify(result));
                if (result) {                    
                    this.vendedores = result;
                } else {
                    this.texto = 'Não há Vendedores';
                }
                this.loading = false;
            })
            .catch(error => {
                this.loading = false;
                console.log('error ', error);
                this.showNotification('ERRO', error, 'error', 'sticky');
            });

        getCreditoSinal({ matricula: this.matricula, idContrato: this.idContrato})
            .then(result => {
                console.log('RESULT getCreditoSinal>> ' + JSON.stringify(result));
                if (result) {                    
                    this.sinal = result;
                } else {
                    this.texto = 'Não há Sinal';
                }
                this.loading = false;
            })
            .catch(error => {
                this.loading = false;
                console.log('error ', error);
                this.showNotification('ERRO', error, 'error', 'sticky');
            });

        getFgts({ matricula: this.matricula, idContrato: this.idContrato})
            .then(result => {
                console.log('RESULT getFgts>> ' + JSON.stringify(result));
                if (result) {                    
                    this.fgts = result;
                } else {
                    this.texto = 'Não há FGTS';
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