import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { loadStyle } from 'lightning/platformResourceLoader'
import COLORS from '@salesforce/resourceUrl/COLORS'

import getEmprestimos from '@salesforce/apex/IntegrationESController.getEmprestimos';
import getModalidades from '@salesforce/apex/IntegrationESController.getModalidades';
import getLimites from '@salesforce/apex/IntegrationESController.getLimites';
import getOpcaoPagamento from '@salesforce/apex/IntegrationESController.getOpcaoPagamento';
import postPropostas from '@salesforce/apex/IntegrationESController.postPropostas';
import getDataEntrada from '@salesforce/apex/IntegrationESController.getDataEntrada';



const column = [
    { label: 'Id', fieldName: 'id' },
    { label: 'Sigla Modalidade', fieldName: 'siglaModalidade' },
    { label: 'Valor Saldo Devedor', fieldName: 'valorSaldoDevedor' },

];

const columnLimits = [
    { label: 'Valor Máximo Empréstimo', fieldName: 'limiteDisponivelNovoEmprestimo' },
    { label: 'Valor Máximo Prestação', fieldName: 'prestacaoMaxima' },
    { label: 'Prazo Max. P/ Pag.', fieldName: 'prazoMaximo' },
    { label: 'Valor em atraso do CFI', fieldName: 'valorAtrasoCFI' },
];
export default class TabSimulacao extends LightningElement {
    @track data = [];
    @track dataLimit = [];
    @api matricula;
    @api column = column;
    @api columnLimits = columnLimits;
    listEmp = [];
    @track listMod = [];
    error;
    value;
    selectedacc = [];
    listCarencia = [];
    qtdEmprestRota = 0;
    dataDebito = '';
    idEmprestimosPrevi;
    idEmpString;
    @track isModalidade = false;
    isLimitTable = false;
    valorAtrasoCFI = '';
    valorEmprestimo = '';
    numeroParcela = '';
    valorPrestacao = '';
    objOpcPgm = {};
    objPostProp = {};
    isBtCritPrev = false;
    isButtonCalc = false;
    isSimulacao = false;
    isOpPg = false;



    /**
    * Inicializa a Página chamando os API's de Anotação e Emprestimo.
    */

    connectedCallback() {
        this.carregandoListEmp();
        this.carregandogeMod();
        this.callDataUtil();

        if (this.isCssLoaded) return
        this.isCssLoaded = true
        loadStyle(this, COLORS).then(() => {
            console.log("Loaded Successfully")
        }).catch(error => {
            console.error("Error in loading the colors")
        })
        
    }

    handleChange(event) {
        this.value = event.detail.value;
        //console.log('this.value modalidade ' + this.value);
    }

    valorEmprestimoChange(event) {
        this.valorEmprestimo = event.detail.value;
        this.isOpPg = false;
        this.isDadosSimulacao = false;
    }

    numeroParcelaChange(event) {
        this.numeroParcela = event.detail.value;
        this.isOpPg = false;
        this.isDadosSimulacao = false;
    }

    valorPrestacaoChange(event) {
        this.valorPrestacao = event.detail.value;
        this.isOpPg = false;
        this.isDadosSimulacao = false;
    }

    getSelected(event) {
        this.selectedacc = this.template.querySelector("lightning-datatable").getSelectedRows();
        //console.log('check ' + JSON.stringify(this.selectedacc));
    }

    async carregandogeMod() {
        await getModalidades({ matricula: this.matricula })
        //await getModalidades({ matricula: '6001835' })
            .then(result => {
                if (result != null) {
                    if (result.erro != true || result.erro == undefined) {
                        for (var key in result) {
                            if (result[key].grupo == 'ROTATIVO') {
                                this.listMod = [{ label: result[key].sigla, value: result[key].id }];
                            }
                        }
                        if (this.listMod.length <= 0) {
                            this.showNotification('ATENÇÃO!', 'Não há opções de empréstimos rotativos disponíveis', 'error', 'dismissible');
                        } else {
                            this.isModalidade = true;
                        }
                    } else {
                        this.showNotification('ATENÇÃO!', 'ERRO - MODALIDADES', 'error', 'dismissible');
                    }
                } else {
                    this.showNotification('ATENÇÃO!', 'Não há opções de empréstimos rotativos disponíveis', 'error', 'dismissible');
                }
            })
            .catch(error => {
                console.log('error ', error);
                this.showNotification('ERRO MODALIDADES', error, 'error', 'dismissible');
            });
    }

    async carregandoListEmp() {
        await getEmprestimos({ matricula: this.matricula })
        //await getEmprestimos({ matricula: '6782051' })
            .then(result => {
                if (result != null) {
                    if (result.erro != true || result.erro == undefined) {
                        for (var key in result) {
                            if (result[key].codigoGrupoModalidade == 'ROTATIVO') {
                                if (result[key].carencia != 'true') {
                                    this.listEmp.push({
                                        id: result[key].id,
                                        siglaModalidade: result[key].siglaModalidade,
                                        valorSaldoDevedor: result[key].valorSaldoDevedor,
                                    });
                                } else {
                                    this.listCarencia.push({ id: result[key].id + ' - ' + result[key].msgCarencia });
                                }
                            }
                        }
                        //console.log('this.listCarencia ' + JSON.stringify(this.listCarencia));
                        this.data = this.listEmp;
                        this.qtdEmprestRota = this.listEmp.length;
                    } else {
                        this.showNotification('ERROR', 'Error - API Emprestimo', 'error', 'dismissible');
                    }
                }
            })
            .catch(error => {
                console.log('error ', error);
                this.showNotification('ERRO EMPRESTIMO', error, 'error', 'dismissible');
            });
    }

    dataDebitoChange(event) {
        this.dataDebito = event.target.value;
        this.isLimitTable = false;
        this.isOpPg = false;
        //console.log('this.dataDebito ' + this.dataDebito);
    }

    callDataUtil(){
        getDataEntrada()
            .then(result => {   
                this.dataDebito = result; 
            })
            .catch (error => {
                console.log('error ', error);
            });
    
    }

    
    async callLimites() {
        try {
            this.isBtCritPrev = true;
            
            if (this.validateFields() == true) {
                if (this.selectedacc.length > 0) {
                    for (var obj in this.selectedacc) {
                        if (this.idEmprestimosPrevi != null || this.idEmprestimosPrevi != '' && this.idEmprestimosPrevi != undefined){
                            this.idEmprestimosPrevi = this.idEmprestimosPrevi + ',' + this.selectedacc[obj].id;
                        }else{
                            this.idEmprestimosPrevi = this.selectedacc[obj].id;
                        }
                    }
                    //this.idEmpString = JSON.stringify(this.idEmprestimosPrevi.join(","));
                    //this.idEmpString = JSON.stringify(this.idEmprestimosPrevi);
                    //console.log('this.idEmprestimosPrevi ' + this.idEmprestimosPrevi);

                }
                
                //await getLimites({ matricula: this.matricula, idEmprestimosPrevi: this.idEmprestimosPrevi, modalidade: '269', dataPrevistaCredito: this.dataDebito })
                await getLimites({ matricula: this.matricula, idEmprestimosPrevi: this.idEmprestimosPrevi, modalidade: this.value, dataPrevistaCredito: this.dataDebito })
                    .then(result => {
                        let listaux = [];
                        this.valorEmprestimo = '';
                        this.numeroParcela = '';
                        this.valorPrestacao = '';

                        if (result != null && result != '') {
                            if (result.error != true || result.error == undefined) {
                                if (result.erro == null || result.erro == undefined) {
                                    listaux.push(result);
                                    this.valorAtrasoCFI = result.valorAtrasoCFI;
                                    this.isLimitTable = true;
                                } else {
                                    this.showNotification('ATENÇÃO ', result.erro, ' warning', 'dismissible');
                                    this.isLimitTable = false;
                                }
                            } else {
                                this.showNotification('ERROR API', 'LIMIT', 'error', 'dismissible');
                                this.isLimitTable = false;
                            }
                            this.dataLimit = listaux;
                        }
                    })
                    .catch((error) => {
                        console.log('error', error);
                    });

                this.isBtCritPrev = false;
            }
        } catch (error) {
            this.error = error;
            this.isBtCritPrev = false;
        }
    }

    async callOpPgm() {
        try {
            this.isButtonCalc = true;
            if (this.validateFieldsOpcPgm() == true) {
                await getOpcaoPagamento({ matricula: this.matricula, modalidade: this.value, dataPrevistaCredito: this.dataDebito, valorEmprestimo: this.valorEmprestimo, prazo: this.numeroParcela, valorPrestacao: this.valorPrestacao })
                //await getOpcaoPagamento({ matricula: '6782051', modalidade: '249', dataPrevistaCredito: this.dataDebito, valorEmprestimo: this.valorEmprestimo, prazo: this.numeroParcela, valorPrestacao: this.valorPrestacao })
                    .then(result => {
                        this.objOpcPgm = result;
                        if (this.objOpcPgm.length > 0) {
                            if (this.objOpcPgm[0].error != true || this.objOpcPgm[0].error == undefined) {
                                if (this.objOpcPgm[0].erro == null || this.objOpcPgm[0].erro == undefined) {
                                    this.valorEmprestimo = this.valorEmprestimo == '' ? this.objOpcPgm[0].valorEmprestimo : this.valorEmprestimo;
                                    this.numeroParcela = this.numeroParcela == '' ? this.objOpcPgm[0].prazo : this.numeroParcela;
                                    this.valorPrestacao = this.valorPrestacao == '' ? this.objOpcPgm[0].valorPrestacao : this.valorPrestacao;
                                    this.isOpPg = true;

                                } else {
                                    this.showNotification('ATENÇÃO ', this.objOpcPgm[0].erro, ' warning', 'dismissible');
                                }
                            } else {
                                this.showNotification('ERROR API', 'LIMIT', 'error', 'dismissible');
                            }
                        }
                    })
                    .catch((error) => {
                        console.log('error', error);
                    });
                this.isButtonCalc = false;
            }
        } catch (error) {
            this.error = error;
            this.isButtonCalc = false;
        }
    }


    async callProp() {
        try {
            this.isSimulacao = true;
            this.isDadosSimulacao = false;
            let objBody = {
                modalidade: this.value,
                dataPrevistaCredito: this.dataDebito,
                valorEmprestimo: this.valorEmprestimo,
                valorPrestacao: this.valorPrestacao,
                prazo: this.numeroParcela,
                idEmprestimosPreviImpactados: this.idEmprestimosPrevi,
            };

            //await postPropostas({ matricula: '1747575', body: JSON.stringify(objBody), gravar: false })
            await postPropostas({ matricula: this.matricula, body: JSON.stringify(objBody), gravar: false })
                .then(result => {
                    if (result != null || result != '') {
                        if (result.error != true || result.error == undefined) {
                            if (result.erro == null || result.erro == undefined) {
                                this.objPostProp = result;
                                this.isDadosSimulacao = true;
                               // console.log(result);
                            } else {
                                this.showNotification('ATENÇÃO ', result.erro, ' warning', 'dismissible');
                            }
                        } else {
                            this.showNotification('ERROR', 'Erro', 'error', 'dismissible');
                        }
                    }

                })
                .catch((error) => {
                    console.log('error', error);
                });

            this.isSimulacao = false;

        } catch (error) {
            this.error = error;
            this.isSimulacao = false;
        }
    }

    /**
    * Faz validações dos inputs onde ao menos dois de três tem que ser preenchido para ser parametro da get Opção de pagamento. 
    */
    validateFieldsOpcPgm() {
        var msn = '';

        let contar = 0;

        contar = this.valorEmprestimo == '' ? contar + 1 : contar;
        contar = this.numeroParcela == '' ? contar + 1 : contar;
        contar = this.valorPrestacao == '' ? contar + 1 : contar;

        if (contar >= 2) {
            msn = "Por favor, preencha o campo.";
        }

        if (msn != "") {
            this.showNotification('ATENÇÃO!', msn, 'warning', 'dismissible');
            return false;
        } else {
            return true;
        }
    }

    /**
    * Faz validações nos campos. 
    */
    validateFields() {
        var msn = '';

        if (this.dataDebito == '') {
            msn = "Por favor, preencha o campo Data do Credito";
        } else if (this.value == '' || this.value == '--Select--' || this.value == undefined) {
            msn = "Por favor, preencha o campo Modalidade";
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