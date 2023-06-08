import { LightningElement, track, api } from 'lwc';



export default class EmprestimoSimples extends LightningElement {
    @track isModalOpen = false;

    @api propostList = [];
    @api matricula;
    @api listAnotacao = [];
  
    @api isPopup = false;
    @api isCond = false;
    @api isAuditoria = false;
    @api objDadosAssociados = {};
    @api isIndicativoCondicao = false;
    @api isIndicativoImpedimento = false;
    @api isIndicativoAuditoria = false;
    @api listSusPg = [];
    @api listImped = [];
    @api listAud = [];
    @api columnSusPg;
    @api columnImpd;
    @api columnAud;

    @api sizeRecordsCond;
    @api sizeRecordsAud;
    @api sizeRecordsImp;
    @api isDadosToast = false;


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

}