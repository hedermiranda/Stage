import {
    LightningElement, track, api
} from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import { loadStyle } from 'lightning/platformResourceLoader'
import COLORS from '@salesforce/resourceUrl/COLORS'

import getProposta from '@salesforce/apex/IntegrationESController.getPropostas';
import getAnotacao from '@salesforce/apex/IntegrationESController.getAnotacao';

import getInformacoesAuditorias from '@salesforce/apex/IntegrationESController.getInformacoesAuditorias';
import getDadosAssociados from '@salesforce/apex/IntegrationESController.getDadosAssociados';
import getImpedimentos from '@salesforce/apex/IntegrationESController.getImpedimentos';
import getSuspensaoPagamentos from '@salesforce/apex/IntegrationESController.getSuspensaoPagamentos';

const columnSusPg = [
    { label: 'Empréstimo', fieldName: 'idEmprestimo' },
    { label: 'Data Prestação', fieldName: 'dataParcela' },
    { label: 'Prestação Suspensa?', fieldName: 'indSuspensao' },
];

const columnImpd = [
    { label: 'Início', fieldName: 'dataInicio' },
    { label: 'Fim', fieldName: 'dataFim' },
    { label: 'Sigla', fieldName: 'sigla' },
    { label: 'Descrição', fieldName: 'descricaoImpedimento' },

];

const columnAud = [
    { label: 'Data evento', fieldName: 'dtEvento' },
    { label: 'Justificativa ', fieldName: 'justificativa' },
];

import getRegistration from '@salesforce/apex/IntegrationESController.getRegistration';

export default class HomeEmprestimoSimples extends LightningElement {
    @track isModalOpen = false;
    @track isPopup = false;
    isCond = false;
    isAuditoria = false;
    loaded = false;
    @api recordId;
    @api initialise;

    @api propostList = [];
    @api listAnotacao = [];

    @api matricula;
    @track error;
    @api objDadosAssociados = {};
    @api isIndicativoCondicao = false;
    @api isIndicativoImpedimento = false;
    @api isIndicativoAuditoria = false;
    @api listSusPg = [];
    @api listImped = [];
    @api listAud = [];
    @api columnSusPg = columnSusPg;
    @api columnImpd = columnImpd;
    @api columnAud = columnAud;
    @api isDadosToast = false;
    anotList = [];
    @track ApiOkay = true;

    @api sizeRecordsCond = 0;
    @api sizeRecordsAud = 0;
    @api sizeRecordsImp = 0;
    initialiseData = [];


    /**
     * PARA TESTE EXCLUIR APOS.
     */

   // matriculaTeste = 600;

    
    /**
    * Inicializa o componente ao carregar.
    */
     connectedCallback() {
        try {
            this.Getmatricula();

            if (this.isCssLoaded) return
            this.isCssLoaded = true
            loadStyle(this, COLORS).then(() => {
                console.log("Loaded Successfully")
            }).catch(error => {
                console.error("Error in loading the colors")
            })
        } catch (error) {
            this.error = error;
        }
    }

    /**
    * Pega a matricula para passar como parametro para as API's.
    */
    async Getmatricula() {
        try {
            await getRegistration({ recordId: this.recordId })
                .then(result => {
                    if (result != null && result != '') {
                        this.matricula = result;
                        this.dadosAssociados();
                        this.callProposta();
                        this.carregandoListAnot();

                    }
                })
                .catch((error) => {
                    console.log('error', error);
                });

        } catch (error) {
            this.error = error;
        }
    }


    /**
    * Chama a API de Dados-Associados.
    */
    async dadosAssociados() {
        //await getDadosAssociados({ matricula: this.matriculaTeste })
        await getDadosAssociados({ matricula: this.matricula })
        //await getDadosAssociados({ matricula: '5624888'})
            .then(result => {
                //console.log('dados ass ' + result);
                if (result != null) {
                    if (result.erro != true || result.erro == undefined) {
                        //console.log('result ' + JSON.stringify(result));
                        this.objDadosAssociados = result;
                        if (result.indicativoCondicao == 'H') {
                            this.carregandoSuspensaoPagamentos();
                            this.isIndicativoCondicao = true;
                        }
                        if (result.indicativoImpedimento == 'S') {
                            this.carregandoImpedimentos();
                            this.isIndicativoImpedimento = true;
                        }
                        if (result.indicativoAuditoria == 'S') {
                            this.carregandoinfoAuditoria();
                            this.isIndicativoAuditoria = true;
                        }
                    } else {
                        this.showNotification('ERROR', 'Error - API Dados Associados', 'error', 'dismissible');
                    }

                } else {
                    this.showNotification('ATENÇÃO!', ' Não Há Dados Associados para essa matrícula ! ', 'warning', 'dismissible');
                }

            }).catch(error => {
                console.log('error', error);
                this.showNotification('ERROR', error, 'error', 'dismissible');
            });

    }

    /**
    * Chama a API de SuspensaoPagamentos/Parcela para preencher o modal de supensões- indicativoCondicao caso retorne 'H'.
    */
    carregandoSuspensaoPagamentos() {
        let auxList = [];
        getSuspensaoPagamentos({ matricula: this.matricula })
        //getSuspensaoPagamentos({ matricula: this.matriculaTeste })
            .then(result => {
                auxList = result;
                if (auxList != null && auxList.length > 0) {
                    if (result.erro != true || result.erro != undefined) {
                    //console.log('result ' + result);
                    this.listSusPg = auxList;
                    this.sizeRecordsCond = this.listSusPg.length;
                    this.isDadosToast = true;
                    } else {
                        this.showNotification('ERROR', 'Error - API Suspensao Pagamentos', 'error', 'dismissible');
                    }
                }
            })
            .catch(error => {
                console.log('error', error);
                this.showNotification('ERROR Suspensao Pagamentos/Parcela', error, 'error', 'dismissible');
            });
    }

    /**
    * Chama a API de Impedimento para preencher o modal de Impedimento - indicativoImpedimento caso retorne 'S'.
    */
    carregandoImpedimentos() {
        let auxList = [];
        //getImpedimentos({ matricula: this.matriculaTeste })
        getImpedimentos({ matricula: this.matricula })
            //getImpedimentos({ matricula: '5624888' })
            .then(result => {
                auxList = result;
                //console.log('impedimento ' + JSON.stringify(result));

                if (auxList != null && auxList.length > 0) {
                    if (result.erro != true || result.erro == undefined) {
                        //console.log('result ' + result);
                        this.listImped = auxList;
                        this.sizeRecordsImp = this.listImped.length;
                        this.isDadosToast = true;
                    }else{
                        this.showNotification('ERROR', 'Error - API Impedimentos', 'error', 'dismissible'); 
                    }
                }
            })
            .catch(error => {
                console.log('error', error);
                this.showNotification('ERROR Impedimento', error, 'error', 'dismissible');
            });
    }

    /**
    * Chama a API de informacoes-auditoria  para preencher o modal de Auditoria - indicativoAuditoria caso retorne 'S'.
    */
    carregandoinfoAuditoria() {
        let auxList = [];
        getInformacoesAuditorias({ matricula: this.matricula })
        //getInformacoesAuditorias({ matricula: this.matriculaTeste })
            .then(result => {
                auxList = result;
                if (auxList != null && auxList.length > 0) {
                    if (result.erro != true || result.erro != undefined) {
                    console.log('result ' + result);
                    this.listAud = auxList;
                    this.sizeRecordsAud = this.listAud.length;;
                    this.isDadosToast = true;
                    } else {
                        this.showNotification('ERROR', 'Error - API Impedimentos Auditoria', 'error', 'dismissible');
                    }
            }
            })
            .catch(error => {
                console.log('error', error);
                this.showNotification('ERROR informacoes-auditoria', error, 'error', 'dismissible');
            });
    }


/**
* Chama a API de proposta.
*/
  async  callProposta() {
     await getProposta({ matricula: this.matricula })
            //getProposta({ matricula: '6782051' })
            .then(result => {
                this.propostList = result;
                if (this.propostList != null) {
                    //console.log('this.propostList ' + JSON.stringify(this.propostList));
                    this.propostList = this.propostList;
                    this.loaded = true;

                    this.ApiOkay = false;
                }
            })
            .catch(error => {
                console.log('error', error);
            });

    }

    /**
    * Chama a API de Anotação.
    */
    carregandoListAnot() {
        getAnotacao({ matricula: this.matricula })
            //getAnotacao({ matricula: '1022125' })
            .then(result => {
                if (result != null) {
                    this.listAnotacao = result;
                }
            })
            .catch(error => {
                console.log('error ', error);
            });
    }

    openModal() {
        this.isModalOpen = true;
    }

    openModalCond() {
        // to open modal set isModalOpen tarck value as true
        this.isPopup = true;
        this.isCond = true;
        this.isAuditoria = false;
        this.isImpredimento = false;
    }

    openModalAud() {
        // to open modal set isModalOpen tarck value as true
        this.isPopup = true;
        this.isAuditoria = true;
        this.isCond = false;
        this.isImpredimento = false;
    }

    openModalImpd() {
        // to open modal set isModalOpen tarck value as true
        this.isPopup = true;
        this.isImpredimento = true;
        this.isCond = false;
        this.isAuditoria = false;
    }

    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isCond = false;
        this.isAuditoria = false;
        this.isModalOpen = false;
        this.isPopup = false;
        this.isImpredimento = falso;
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