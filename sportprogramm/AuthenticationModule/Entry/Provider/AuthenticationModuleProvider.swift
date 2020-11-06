
protocol AuthenticationModuleProviderProtocol {
    func getItems(completion: @escaping ([AuthenticationModuleModel]?, AuthenticationModuleProviderError?) -> Void)
    func getRequestFromFb(by email: String, password: String, completion: @escaping ([AuthenticationModuleModel]?, AuthenticationModuleProviderError?) -> Void)
}

enum AuthenticationModuleProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}

struct AuthenticationModuleProvider: AuthenticationModuleProviderProtocol {
    let dataStore: AuthenticationModuleDataStore
    let service: AuthenticationModuleServiceProtocol

    init(dataStore: AuthenticationModuleDataStore = AuthenticationModuleDataStore(), service: AuthenticationModuleServiceProtocol = AuthenticationModuleService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping ([AuthenticationModuleModel]?, AuthenticationModuleProviderError?) -> Void) {
        if dataStore.models?.isEmpty == false {
            return completion(self.dataStore.models, nil)
        }
        service.fetchItems { (array, error) in
            if let error = error {
                completion(nil, .getItemsFailed(underlyingError: error))
            } else if let models = array {
                self.dataStore.models = models
                completion(self.dataStore.models, nil)
            }
        }
    }
    
    func getRequestFromFb(by email: String, password: String, completion: @escaping ([AuthenticationModuleModel]?, AuthenticationModuleProviderError?) -> Void) {
        if dataStore.models?.isEmpty == false {
            return completion(self.dataStore.models, nil)
        }
        service.authenticate(by: email, password: password) { (array, error) in
            if let error = error {
                completion(nil, .getItemsFailed(underlyingError: error))
            } else if let models = array {
                self.dataStore.models = models
                completion(self.dataStore.models, nil)
                
            }
        }
    }
}
