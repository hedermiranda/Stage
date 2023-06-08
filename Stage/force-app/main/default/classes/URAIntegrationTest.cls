@isTest
public class URAIntegrationTest {
    @isTest
	static void getCaseTestMatricula(){
   		Test.startTest();
            RestRequest req = new RestRequest(); 
            RestResponse res = new RestResponse();
            req.requestURI = '/services/apexrest/caseura';
        	req.params.put('matricula', '19570260');
        	req.params.put('canal', 'atendimento');
            req.httpMethod = 'GET';
            req.addHeader('Content-Type', 'application/json'); 
            RestContext.request = req;
            RestContext.response = res;
            URAIntegration.ResponseWS usr1 = URAIntegration.getCase();
            //System.debug(usr1);
   		Test.stopTest();

	}
    
    @isTest
    static void getCaseTestCPF(){
   		Test.startTest();
            RestRequest req = new RestRequest(); 
            RestResponse res = new RestResponse();
            req.requestURI = '/services/apexrest/caseura';
        	req.params.put('cpf', '09778941562');
        	req.params.put('canal', 'ouvidoria');
            req.httpMethod = 'GET';
            req.addHeader('Content-Type', 'application/json'); 
            RestContext.request = req;
            RestContext.response = res;
            URAIntegration.ResponseWS usr1 = URAIntegration.getCase();
            //System.debug(usr1);
   		Test.stopTest();

	}
}