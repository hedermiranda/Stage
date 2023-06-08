import { LightningElement, track, api, wire } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import COLORS from '@salesforce/resourceUrl/COLORS';
import { loadStyle } from 'lightning/platformResourceLoader';
import getRegistration from '@salesforce/apex/FinImobController.getRegistration';
import getContratos from '@salesforce/apex/FinImobController.getContratos';
import getDadosFin from '@salesforce/apex/FinImobController.getDadosFin'; 
import getDevedorSolidario from '@salesforce/apex/FinImobController.getDevedorSolidario'; 
import getLiquidacoes from '@salesforce/apex/FinImobController.getLiquidacoes';

export default class FinImobFixa extends LightningElement {
    contratos = []; //this will hold key, value pair
    dadosFin = [];
    liquidacoes = [];
    @track value = ''; //initialize combo box value
    @api recordId ;
    @track isModalOpen = false;
    map = new Map();

    matricula;
    returnContract;
    texto; // apagar
    loading=true;
    idContrato = false;
    devedorSolidario = '';
    dados = true;
    listDadosContrato;
    dadosContrato;
    @track error;

    connectedCallback() {
        console.log('Entrou callback');
        this.getMatricula();
        if (this.isCssLoaded) return
            this.isCssLoaded = true
            loadStyle(this, COLORS).then(() => {
                console.log("Loaded Successfully")
            }).catch(error => {
                console.error("Error in loading the colors")
            })
    }

   getMatricula() {
        getRegistration({ recordId : this.recordId })
            .then(result => {    
                console.log('result >> ' + result);    
                if (result != '') {                    
                    this.matricula = result;
                    console.log('this.matricula no getMatricula >> ' + this.matricula);
                }
            })
            .catch((error) => {
                console.log('error', error);
            })
            .finally( () => {        
                if(this.matricula != undefined){
                    console.log('.finally ' );
                    this.loadingContratos(); 
                }
            })        
    }

    loadingContratos() {
        console.log('Entrou loadingContratos com a matricula >>' + this.matricula);
        getContratos({ matricula: this.matricula})
            .then(result => {
                console.log('RESULT getContratos>> ' + JSON.stringify(result));
                if (result.length>0) {
                    this.returnContract = true;
                    console.log('contratos size >> ' + result.length);
                    for (let i = 0; i < result.length; i++) {
                        console.log('entrou no for');
                        this.contratos = [...this.contratos ,{value: result[i].Contrato , label: result[i].Contrato}];
                    }   
                    this.listDadosContrato = result; 
                    this.dadosContrato = result;                            
                    console.log('this.contratos >> ' + this.contratos);
                    

                } else {
                    this.returnContract = false;
                    this.texto = 'Não há CONTRATOS para essa matrícula!';
                }
                this.loading = false;
            })
            .catch(error => {
                this.loading = false;
                console.log('error ', error);
                this.showNotification('ERRO AA', error, 'error', 'sticky');
            }
        );
    }

    loadingDadosFin(){
       getDadosFin({ matricula: this.matricula})
            .then(result => {
                if (result && result.idContrato === this.idContrato) {
                    this.dadosFin = result;     
                    console.log('this.dadosFin.idContrato > ' + this.dadosFin.idContrato + '\nthis.idContrato > ' + this.idContrato);      
                    //this.dados = this.dadosFin.idContrato == this.idContrato ? true : false;
                }else{
                    this.dadosFin = [];
                }
            })
            .catch(error => {
                console.log('error ', error);
                this.showNotification('ERRO AA', error, 'error', 'sticky');
            }
        );

        getDevedorSolidario({ matricula: this.matricula, idContrato: this.idContrato})
            .then(result => {
                if (result) {
                    this.devedorSolidario = result.nom_pessoa;           
                    this.loading = false;
                }
            })
            .catch(error => {
                console.log('error ', error);
                this.showNotification('ERRO AA', error, 'error', 'sticky');
            }
        );

        getLiquidacoes({ matricula: this.matricula, idContrato: this.idContrato})
            .then(result => {
                if (result) {
                    this.liquidacoes = result;
                }
            })
            .catch(error => {
                console.log('error ', error);
                this.showNotification('ERRO AA', error, 'error', 'sticky');
            }
        ); getLiquidacoes
    }

    get options() {
        return this.contratos;
    }

    handleChange(event) {
        this.loading = true;
        this.idContrato = event.detail.value;
        this.dadosContrato = this.listDadosContrato.find((item) => item.Contrato === this.idContrato);
        this.loadingDadosFin();
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

    openModal(){
        this.isModalOpen = true;
    }

    closeModal() {
        this.isModalOpen = false;  
    }
}