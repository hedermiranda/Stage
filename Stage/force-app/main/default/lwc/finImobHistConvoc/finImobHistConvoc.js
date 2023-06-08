import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getCarta from '@salesforce/apex/FinImobController.getCarta';
import getHistoricoImpedimentos from '@salesforce/apex/FinImobController.getHistoricoImpedimentos';
import getHistValClassificacoes from '@salesforce/apex/FinImobController.getHistValClassificacoes';

export default class FinImobHistConvoc extends LightningElement {
    @api matricula

    carta = [];
    histImpedimentos = [];
    hisValClass = [];

    connectedCallback() {
        console.log('Entrou FinImobHistConvoc');
        this.loadingHistConvoc();
    }

    loadingHistConvoc(){
        console.log('Entrou loadingHistConvoc com a matricula >>' + this.matricula);
        getCarta({ matricula: this.matricula})
            .then(result => {
                console.log('RESULT getCarta>> ' + JSON.stringify(result));
                if (result) {                    
                    this.carta = result;
                } else {
                    this.texto = 'Não há Carta';
                }
                this.loading = false;
            })
            .catch(error => {
                this.loading = false;
                console.log('error ', error);
                this.showNotification('ERRO', error, 'error', 'sticky');
            });

            getHistoricoImpedimentos({ matricula: this.matricula})
            .then(result => {
                console.log('RESULT getHistoricoImpedimentos>> ' + JSON.stringify(result));
                if (result) {                    
                    this.histImpedimentos = result;
                } else {
                    this.texto = 'Não há Impedimentos';
                }
                this.loading = false;
            })
            .catch(error => {
                this.loading = false;
                console.log('error ', error);
                this.showNotification('ERRO', error, 'error', 'sticky');
            });

        getHistValClassificacoes({ matricula: this.matricula})
            .then(result => {
                console.log('RESULT getHistValClassificacoes>> ' + JSON.stringify(result));
                if (result) {                    
                    this.hisValClass = result;
                } else {
                    this.texto = 'Não há Histórico para Valores de Classificações';
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