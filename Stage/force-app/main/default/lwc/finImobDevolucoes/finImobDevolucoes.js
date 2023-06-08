import { LightningElement, api } from 'lwc';

export default class FinImobDevolucoes extends LightningElement {
    @api idContrato
    @api matricula

    connectedCallback() {
        console.log('Entrou FinImobDevolucoes');
        this.getDevolucoes();
    }

    getDevolucoes(){
        
    }

    handleChange(event) {/*
        let value = event.target.accessKey;
        let listaux = [];
        for (let i in this.listTableAll) {
            this.listTableAll[i]["isDisabled"] = !this.listTableAll[i]["isDisabled"];
            if (i == value) {
                this.listTableAll[i]["areDetailsVisible"] = !this.listTableAll[i]["areDetailsVisible"];
                this.listTableAll[i]["isDisabled"] = false;
                if (this.mapBackupExtrato.has(this.listTableAll[i]["id"])) {
                    this.ExtratObj = this.mapBackupExtrato.get(this.listTableAll[i]["id"]);
                } else {
                    //this.carregandoListExtrato('6782051', this.listTableAll[i]["id"]);
                   this.carregandoListExtrato(this.matricula, this.listTableAll[i]["id"]);
                }
            }

            listaux.push(this.listTableAll[i]);
        }
       this.listTableAll = listaux;
        this.loadPreview = false;*/
    }
}