public with sharing class IntegrationServices {
    public static Map<String,Object> sendGetRequest(String endpoint){
        HttpRequest req = new HttpRequest();
        req.setEndPoint(endpoint);
        req.setMethod('GET');
        req.setTimeout(40000);
        req.setHeader('x-ibm-client-id','125e14a00e87c3906c284d5c9b6a156d');
        req.setHeader('x-ibm-client-secret','c5d223b7dcecbcaf23717478b49aeb64');
        
        Map<String,Object> mapResponse = new Map<String,Object>();
        try{            
            Http http = new Http();
            HTTPResponse res = http.send(req);
            //System.debug(res?.getBody());
            
            mapResponse.put('body', res?.getBody());
            mapResponse.put('statusCode', res?.getStatusCode());
        }catch(Exception e){
            System.debug('Exception >> ' + e);
        }
        return mapResponse;
    }
            /*
        public static Map<String,Object> sendPutRequest(String bodyRequest, String endpoint, String method){
        HttpRequest req = new HttpRequest();
        req.setEndPoint(endpoint);
        req.setMethod(method);
        req.setTimeout(40000);
        req.setHeader('x-ibm-client-id','125e14a00e87c3906c284d5c9b6a156d');
        req.setHeader('x-ibm-client-secret','c5d223b7dcecbcaf23717478b49aeb64');
        System.debug('bodyRequest recebido > ' + bodyRequest);
        System.debug('bodyRequest Serializado > ' + JSON.serialize(bodyRequest));
        req.setBody(JSON.serialize(bodyRequest));
        
        Map<String,Object> mapResponse = new Map<String,Object>();
        try{            
        Http http = new Http();
        HTTPResponse res = http.send(req);
        //System.debug(res?.getBody());
        
        mapResponse.put('body', res?.getBody());
        mapResponse.put('statusCode', res?.getStatusCode());
        }catch(Exception e){
        System.debug('Exception >> ' + e);
        }
        return mapResponse;
        }*/
    
    
    private static final String AUTHORIZATION_HEADER = 'Authorization';
    private static final String BEARER = 'Bearer';
    private static final String OAUTH2 = 'OAUTH2'; 
    private static final String APIKey = 'API Key';   
    private static final String ACCESS_TOKEN = 'access_token';   
    
    /**
    * Método assincrono de realização de um callout
    */
    @future
    public static void asyncCallout(String parameterCalloutKey, List<String> pathParams, Map<String,String> queryParams, Map<String,String> headers, String body) {
        syncCallout(parameterCalloutKey, pathParams, queryParams, headers, body);
    }
    
    /**
    * Método sincrono de realização de um callout
    */
    public static HTTPResponse syncCallout(String parameterCalloutName, List<String> pathParams, Map<String,String> queryParams, Map<String,String> headers, String body) {
        try {
            String aux;
            if(String.isNotBlank(parameterCalloutName)) {
                ParameterCallout__mdt parameter = ParameterCallout__mdt.getInstance(parameterCalloutName);
                if(parameter != null) {
                    HttpRequest request = new HttpRequest();
                    request.setEndpoint(parameter.EndPoint__c);
                    request.setMethod(parameter.Method__c);
                    
                    if(parameter.Timeout__c != null) {
                        request.setTimeout(Integer.valueOf(parameter.Timeout__c));
                    }                    
                    
                    if(pathParams != null && !pathParams.isEmpty()) {
                        for(String pathParam : pathParams) {
                            request.setEndpoint(request.getEndpoint() + '/' + pathParam );
                        }                    
                    }
                    
                    if(queryParams != null && !queryParams.isEmpty()) {
                        request.setEndpoint(request.getEndpoint() + '?');
                        for(String queryParamKey : queryParams.keySet()) {
                            request.setEndpoint(request.getEndpoint() + queryParamKey + '=' + queryParams.get(queryParamKey) + '&');                        
                        }                    
                        request.setEndpoint(request.getEndpoint().removeEnd('&'));
                    }
                    
                    if(headers != null && !headers.isEmpty()) {
                        for(String headerKey : headers.keySet()) {
                            request.setHeader(headerKey, headers.get(headerKey));  
                        }                    
                    }
                    
                    
                    if(String.isNotBlank(body)) {
                        request.setBody(body);
                    }
                    
                    if(OAUTH2.endsWithIgnoreCase(parameter.AuthenticationMethod__c) && String.isNotBlank(parameter.AuthenticationConfigReference__c)) {
                        generateOauthToken(request,parameter.AuthenticationConfigReference__c);
                    }
                    
                    
                    System.debug('-> Executando request:\nURL: ' + request.getEndpoint() + '\nBody: ' + request.getBody() + '\nHeaders: ' + headers);
                    Http http = new Http();
                    HTTPResponse response = http.send(request);
                    System.debug(' -> Response StatusCode ' + response.getStatusCode());
                    System.debug(' -> Response Body ' + response.getBody());
                    return response;
                    
                } else {
                    System.debug(' -> Não foi encontrado uma configuração no ParameterCallout__mdt para a chave ' + parameterCalloutName);
                }
            }
            return null;
        } catch(Exception e) {
            System.debug('Erro na chamada da API de chave de configuração ' + parameterCalloutName + ' do ParameterCallout__mdt ' + 'Linha ' + e.getLineNumber() + 'Mensagem ' + e.getMessage());
            throw e;
        }
    }
    
    private static void generateOauthToken(HttpRequest request, String authenticationConfigReference) {
        HTTPResponse responseAPI = syncCallout(authenticationConfigReference,null,null,new Map<String,String> {'Content-Type' => 'application/x-www-form-urlencoded'},'grant_type=client_credentials');
        if(responseAPI != null && String.isNotBlank(responseAPI.getBody())) {
            Map<String,Object> response = (Map<String,Object>)JSON.deserializeUntyped(responseAPI.getBody());
            System.debug('tokenResponse' + response);
            System.debug('ACCESS_TOKEN' + ACCESS_TOKEN);
            if(response != null && response.containsKey(ACCESS_TOKEN)) {
                String token = String.valueOf(response.get(ACCESS_TOKEN));
                request.setHeader(AUTHORIZATION_HEADER, BEARER + ' ' + token);
                System.debug('-> Token OAUTH2 gerado com sucesso: ' + token);
            }
        }
        if(String.isBlank(request.getHeader(AUTHORIZATION_HEADER))) {
            System.debug(' -> Ocorreu um erro na geração do access token OAUTH2');
        }
    }  
    
}