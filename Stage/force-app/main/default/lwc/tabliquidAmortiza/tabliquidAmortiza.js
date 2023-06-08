import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import getEmprestimosLiquidados from '@salesforce/apex/IntegrationESController.getEmprestimosLiquidados';
import getLqAmtInformacao from '@salesforce/apex/IntegrationESController.getLqAmtInformacao';
import { loadStyle } from 'lightning/platformResourceLoader'
import COLORS from '@salesforce/resourceUrl/COLORS'

const columns = [
    { label: 'Empréstimo', fieldName: 'id' },
    { label: 'Movimento', fieldName: 'siglaMovimento' },
    { label: 'Dt. Vencto.', fieldName: 'dtVencto' },
    { label: 'Dt. Cancel', fieldName: 'dtCancel' },
    { label: 'Valor Cobrado', fieldName: 'valorCobrado' },
    { label: 'Valor Pagamento', fieldName: 'valorPag' },
    { label: 'Forma Liq./ Amort.', fieldName: 'formaLiqAmort' },
];

export default class TabliquidAmortiza extends LightningElement {

    @track listEmpLiq = [];
    @api matricula;
    columns = columns;
    loaded = true;
    dataDebito = '';
    dataDebitoAm = '';
    numeroEmpAm = '';
    valorAmort = '';
    idEmprestimo;
    numeroEmp = '';
    saldoLiquidacao = '';
    reduzirPrestacao = [];
    reduzirPrazo = [];
    isAmortizacao = false;
    isLiquidacao = false;

    /**
    * Inicializa a Página carregando os campos com retono da API .
    */
    connectedCallback() {
        this.carregandoEmprLiquidados();

        if (this.isCssLoaded) return
        this.isCssLoaded = true
        loadStyle(this, COLORS).then(() => {
            console.log("Loaded Successfully")
        }).catch(error => {
            console.error("Error in loading the colors")
        })
    }

    carregandoEmprLiquidados() {
        let auxList = [];
        getEmprestimosLiquidados({ matricula: this.matricula })
        //getEmprestimosLiquidados({ matricula: '6634498' })
            .then(result => {
                auxList = result;
                if (auxList != null && auxList.length > 0) {
                    for (var key in auxList) {
                        this.idEmprestimo = auxList[key].id;
                        this.listEmpLiq.push({
                            id: auxList[key].id != null ? auxList[key].id : '',
                            siglaMovimento: auxList[key].siglaMovimento != null ? auxList[key].siglaMovimento : '',
                            dtVencto: auxList[key].dtVencto != null ? auxList[key].dtVencto : '',
                            dtCancel: auxList[key].dtCancel != null ? auxList[key].dtCancel : '',
                            valorCobrado: auxList[key].valorCobrado != null ? auxList[key].valorCobrado : '',
                            valorPag: auxList[key].valorPag != null ? auxList[key].valorPag : '',
                            formaLiqAmort: auxList[key].formaLiqAmort != null ? auxList[key].formaLiqAmort : '',
                        });
                    }

                } else {
                    this.listEmpLiq.push({
                        id: '',
                        siglaMovimento: '',
                        dtVencto: '',
                        dtCancel: '',
                        valorCobrado: '',
                        valorPag: '',
                        formaLiqAmort: '',
                    });
                    this.showNotification('ATENÇÃO!', 'Não há EMPRESTIMO LIQUIDADO para essa matrícula ! ', 'warning', 'dismissible');
                }
                this.loaded = false;
            })

            .catch(error => {
                this.listEmpLiq.push({
                    id: '',
                    siglaMovimento: '',
                    dtVencto: '',
                    dtCancel: '',
                    valorCobrado: '',
                    valorPag: '',
                    formaLiqAmort: '',
                });
                console.log('error ', error);
                this.loaded = false;
                this.showNotification('ERRO EMPRESTIMO LIQUIDADO', error, 'error', 'dismissible');
            });

    }

    carregandoLqAmtInformacao(buttonName) {
        let listOpcao = [];
        if (buttonName == 'Amort') {
            if (this.validateFieldsAmot() == true) {
                //getLqAmtInformacao({ matricula: '4711240', idEmprestimo: this.numeroEmpAm, valorAmortizacao: this.valorAmort, dataEvento: this.dataDebitoAm })
                getLqAmtInformacao({ matricula: this.matricula, idEmprestimo: this.numeroEmpAm, valorAmortizacao: this.valorAmort, dataEvento: this.dataDebitoAm })   
                .then(result => {
                        if (result != null) {
                            if (result.erro != true || result.erro == undefined) {
                                if (result.amortizacao != null) {
                                    listOpcao = result.amortizacao.opcoes;
                                    //console.log('amort ' + listOpcao);
                                    if (listOpcao.length > 0) {
                                        for (var key in listOpcao) {
                                            if (listOpcao[key].id == 1) {
                                                this.reduzirPrazo = {
                                                    saldoDevedor: listOpcao[key].saldoDevedor,
                                                    prestacaoAtual: listOpcao[key].prestacao,
                                                    prazoRestante: listOpcao[key].prazo,
                                                };
                                            } else {
                                                this.reduzirPrestacao = {
                                                    saldoDevedor: listOpcao[key].saldoDevedor,
                                                    prestacaoAtual: listOpcao[key].prestacao,
                                                    prazoRestante: listOpcao[key].prazo,
                                                };
                                            }
                                        }
                                        this.isAmortizacao = true;
                                    } else {
                                        this.showNotification('ATENÇÃO!', 'Não há AMORTIZAÇÃO para essa matrícula e Número de Emprestimo ! ', 'warning', 'dismissible');
                                    }
                                } else {
                                    this.showNotification('ATENÇÃO!', 'Não há AMORTIZAÇÃO para essa matrícula e Número de Emprestimo ! ', 'warning', 'dismissible');
                                }
                                //aqui
                            } else {
                                this.showNotification('ERRO', 'API', 'error', 'dismissible');
                            }
                        } else {
                            this.showNotification('ATENÇÃO!', 'Não há LIQUIDAÇÃO/AMORTIZAÇÃO para essa matrícula e Número de Emprestimo ! ', 'warning', 'dismissible');
                        }
                    }).catch(error => {
                        console.log('error ', error);
                        this.showNotification('Empréstimo inexistente para a matrícula informada!', error, 'error', 'dismissible');
                    });
            }
        } else if (buttonName == 'Liquid') {
            if (this.validateFieldsLiquid() == true) {
                //getLqAmtInformacao({ matricula: '4711240', idEmprestimo: this.numeroEmp, valorAmortizacao: this.valorAmort, dataEvento: this.dataDebito })
                getLqAmtInformacao({ matricula: this.matricula, idEmprestimo: this.numeroEmp, valorAmortizacao: this.valorAmort, dataEvento: this.dataDebito })    
                .then(result => {
                        if (result != null) {
                            if (result.erro != true || result.erro == undefined) {
                                this.isLiquidacao = true;
                                this.saldoLiquidacao = result.projecaoSaldoDevedor.saldoDevedorParaLiquidacao;
                            } else {
                                this.showNotification('ERRO', 'API', 'error', 'dismissible');
                            }
                        } else {
                            this.showNotification('ATENÇÃO!', 'Não há LIQUIDAÇÃO para essa matrícula e Número de Emprestimo ! ', 'warning', 'dismissible');
                        }
                    }).catch(error => {
                        console.log('error ', error);
                        this.showNotification('Empréstimo inexistente para a matrícula informada!', error, 'error', 'dismissible');
                    });
            }

        }
    }


    numeroEmpChange(event) {
        this.numeroEmp = event.target.value;
        this.isLiquidacao = false;
        //console.log('this.numeroEmp' + this.numeroEmp);
    }

    numeroEmpAmChange(event) {
        this.numeroEmpAm = event.target.value;
        this.isAmortizacao = false;
        //console.log('this.numeroEmpAm' + this.numeroEmpAm);
    }

    dataDebitoChange(event) {
        this.dataDebito = event.target.value;
        this.isLiquidacao = false;
        //console.log('this.dataDebito ' + this.dataDebito);
    }

    dataDebitoAmChange(event) {
        this.dataDebitoAm = event.target.value;
        this.isAmortizacao = false;
        //console.log('this.dataDebitoAm ' + this.dataDebitoAm);
    }

    valorAmortChange(event) {
        this.valorAmort = event.target.value;
        this.isAmortizacao = false;
        //console.log('this.valorAmort  ' + this.valorAmort);
    }

    getCalcular(event) {
        let buttonName = event.target.dataset.name;
        //console.log('buttonName ' + buttonName);
        this.carregandoLqAmtInformacao(buttonName);
    }


    /**
    * Faz validações nos campos da tab de Liquidação. 
    */
    validateFieldsLiquid() {
        var msn = '';

        if (this.dataDebito == '') {
            msn = "Por favor, preencha o campo Data do Debito";
        } else if (this.numeroEmp == '') {
            msn = "Por favor, preencha o campo Número do Empréstimo";
        }
        if (msn != "") {
            this.showNotification('ATENÇÃO!', msn, 'warning', 'dismissible');
            return false;
        } else {
            return true;
        }
    }

    /**
    * Faz validações nos campos da tab Amortização. 
    */
    validateFieldsAmot() {
        var msn = '';

        if (this.dataDebitoAm == '') {
            msn = "Por favor, preencha o campo Data do Debito";
        } else if (this.numeroEmpAm == '') {
            msn = "Por favor, preencha o campo Número do Empréstimo";
        } else if (this.valorAmort == '') {
            msn = "Por favor, preencha o campo Valor a amortizar";
        }
        if (msn != "") {
            this.showNotification('ATENÇÃO!', msn, 'warning', 'dismissible');
            return false;
        } else {
            return true;
        }
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