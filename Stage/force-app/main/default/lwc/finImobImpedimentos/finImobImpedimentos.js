import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getImpedimentos from '@salesforce/apex/FinImobController.getImpedimentos';

export default class FinImobImpedimentos extends LightningElement {
    @api idContrato;
    @api matricula;
    texto;

    listImpedimentos = [];

    connectedCallback() {
        console.log('Entrou FinImobImpedimentos');
        this.loadingImpedimentos();
    }

    loadingImpedimentos(){
        console.log('Entrou loadingImpedimentos com a matricula >>' + this.matricula);
        getImpedimentos({ matricula: this.matricula, idContrato: this.idContrato})
            .then(result => {
                console.log('RESULT getImpedimentos>> ' + JSON.stringify(result));
                if (result.length > 0) {
                    let returnImpedimentos = [];
                    result.forEach(rec => {
                        let record = {};
                        record.tipo_impdto = rec.tipo_impdto;
                        record.justificativa = rec.justificativa;
                        record.inicio_Vigencia = rec.inicio_Vigencia;
                        record.fim_Vigencia = rec.fim_Vigencia;

                        returnImpedimentos.push(record);
                    })
                    
                    this.listImpedimentos = returnImpedimentos;
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