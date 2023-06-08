import { LightningElement,api,track } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';


import getRenegCondic from '@salesforce/apex/IntegrationESController.getRenegCondic';
import getEmprestimos from '@salesforce/apex/IntegrationESController.getEmprestimos';


export default class TabSimulacaoRenegociacao extends LightningElement {

    @api matricula;
    listTableAll = [];
    ListRngCond = [];
    listTable = [];
    loaded = true;
    isDisabled = false;
    empList = [];
    mapBackupRenegCondic = new Map();
    objRenegCondic = {
        saldoDevedor: '',
        prazo: '',
        prestacaoInicial: '',
    };



    /**
    * Inicializa a Página chamando os API's de Anotação e Emprestimo.
    */
    connectedCallback() {
        this.carregandoListEmp();
    }

    /**
     * Montando a tabela com retornos das API's e se erro/vazio mockar com branco para exibir os campos.
     */
    carregando(empList) {
        try {
        if (empList != null && empList.length > 0) {

            for (var key in empList) {

            this.listTable.push({
                id: empList[key].id,
                siglaModalidade: empList[key].siglaModalidade,
                valorSaldoDevedorAtual: empList[key].valorSaldoDevedorAtual,
                valorPrestacao: empList[key].valorPrestacao,
                qtdPrestacoesIniciais: empList[key].qtdPrestacoesIniciais,
                qtdPrestacoesCobradas: empList[key].qtdPrestacoesCobradas,
                qtdPrestacoesPagas: empList[key].qtdPrestacoesPagas,
                qtdPrestacoesRestantes: empList[key].qtdPrestacoesRestantes,
                        });
            }   
        } else {
            this.listTable.push({
                id: '',
                siglaModalidade: '',
                valorSaldoDevedorAtual: '',
                valorPrestacao: '',
                qtdPrestacoesIniciais: '',
                qtdPrestacoesCobradas: '',
                qtdPrestacoesPagas: '',
                qtdPrestacoesRestantes: '',
            });
            
        }
        } catch (error) {
            this.error = error;
        } finally {
            this.listTableAll = this.listTable;
            this.loaded = false;        }
    }

    async carregandoListEmp() {
        try {
        await getEmprestimos({ matricula: this.matricula })
        //await getEmprestimos({ matricula: '6782051' })
            .then(result => {
                if (result != null) {
                    if (result.erro != true || result.erro == undefined) {
                    this.empList = result;
                    //console.log('this.empList ' + JSON.stringify(this.empList));
                    }else{
                        this.showNotification('ERROR', 'Error - API Emprestimo', 'error', 'dismissible');
                    }
                } else {
                    this.showNotification('ATENÇÃO!', 'Não há EMPRESTIMO para essa matrícula ! ', 'warning', 'dismissible');
                }
            
            })
            .catch(error => {
                console.log('error ', error);
                this.showNotification('ERRO EMPRESTIMO', error, 'error', 'sticky');       
            });
        } catch (error) {
            this.error = error;
        } finally {
            this.carregando(this.empList);
        }
    }

    async carregandoListRngCond(matricula, idEmprestimo) {
       await getRenegCondic({ matricula: matricula, idEmprestimo: idEmprestimo })
            .then(result => {
                if (result != null) {
                    this.objRenegCondic = {
                        saldoDevedor: result.saldoDevedor,
                        prazo: result.prazo,
                        prestacaoInicial: result.prestacaoInicial,
                    };

                    this.mapBackupRenegCondic.set(idEmprestimo, this.objRenegCondic);

                    //console.log('listTableAll' + JSON.stringify(this.mapBackupRenegCondic));

                } else {
                    this.showNotification('ATENÇÃO!', 'Não há Condicoes de Renegociacao para essa matrícula e Id do Empréstimo! ', 'warning', 'dismissible');

                    this.objRenegCondic = {
                        saldoDevedor: '',
                        prazo: '',
                        prestacaoInicial: '',
                    };
                }

            })
            .catch(error => {
                console.log('error ', error);
                this.showNotification('ERRO', error, 'error', 'sticky');
            });

    }

    /**
    * Chamado no onclick do button-icone  e verifica se já foi chamado anteriormente se sim reutiliza a lista carregada na chamada anterior.
    */
    handleChange(event) {
        let value = event.target.accessKey;
        let listaux = [];
        for (let i in this.listTableAll) {
            this.listTableAll[i]["isDisabled"] = !this.listTableAll[i]["isDisabled"];
            if (i == value) {
                this.listTableAll[i]["areDetailsVisible"] = !this.listTableAll[i]["areDetailsVisible"];
                this.listTableAll[i]["isDisabled"] = false;
                if (this.listTableAll[i]["isDisabled"] == false){
                if (this.mapBackupRenegCondic.has(this.listTableAll[i]["id"])) {
                    this.objRenegCondic = this.mapBackupRenegCondic.get(this.listTableAll[i]["id"]);
                } else {
                    this.carregandoListRngCond('6782051', this.listTableAll[i]["id"]);
                    //this.carregandoListRngCond(this.matricula, this.listTableAll[i]["id"]);
                }
                }
            }

            listaux.push(this.listTableAll[i]);
        }
        this.listTableAll = listaux;
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