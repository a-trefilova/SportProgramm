//
//  Created by Alyona Sabitskaya on 27/10/2020.
//

protocol authModuleProviderProtocol {
    func getItems(completion: @escaping ([authModuleModel]?, authModuleProviderError?) -> Void)
}

enum authModuleProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}

/// Отвечает за получение данных модуля authModule
struct authModuleProvider: authModuleProviderProtocol {
    let dataStore: authModuleDataStore
    let service: authModuleServiceProtocol

    init(dataStore: authModuleDataStore = authModuleDataStore(), service: authModuleServiceProtocol = authModuleService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping ([authModuleModel]?, authModuleProviderError?) -> Void) {
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
}
