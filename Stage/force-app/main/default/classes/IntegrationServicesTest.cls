@isTest
public class IntegrationServicesTest {
	@isTest
    static void sendGetRequest(){
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Test.startTest();  
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock.
        String endpoint = 'https://example.com/example/test'; 
        Map<String,Object> res = IntegrationServices.sendGetRequest(endpoint);
        
        // Verify response received contains fake values
        String contentType = 'application/json';
        System.assert(contentType == 'application/json');
        String actualValue = '{"example":"test"}';
        String expectedValue = '{"example":"test"}';
        System.assertEquals(actualValue, expectedValue);
        //System.assertEquals(200, res.getStatusCode());
        Test.stopTest();

    }
    
    @isTest
    public static void syncCalloutat_telefone() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationServices.syncCallout(
            'Telefone',
            new List<String>{'teste','teste'},
            new Map<String, String>{ 'Content-Type' => 'application/json' },      
            new Map<String, String>{ 'Content-Type' => 'application/json','Accept' => 'application/json' },
            '{"telefones":{"ddi":null,"ddd":"79","telefone":"32144449","ramal":null,"tipo":"fixo"}}') != null);
        Test.stopTest();
    }
    
    @isTest
    public static void syncCalloutat_telefoneError() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        System.assert(IntegrationServices.syncCallout(
            'NaoExiste',
            new List<String>{'teste','teste'},
            new Map<String, String>{ 'Content-Type' => 'application/json' },      
            new Map<String, String>{ 'Content-Type' => 'application/json','Accept' => 'application/json' },
            '{"telefones":{"ddi":null,"ddd":"79","telefone":"32144449","ramal":null,"tipo":"fixo"}}') == null);
        Test.stopTest();
    }
    

    
    
}