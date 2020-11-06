//
//  Created by Alyona Sabitskaya on 06/11/2020.
//

protocol PasswordRecoveryProviderProtocol {
    func getItems(completion: @escaping ([PasswordRecoveryModel]?, PasswordRecoveryProviderError?) -> Void)
}

enum PasswordRecoveryProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}

/// Отвечает за получение данных модуля PasswordRecovery
struct PasswordRecoveryProvider: PasswordRecoveryProviderProtocol {
    let dataStore: PasswordRecoveryDataStore
    let service: PasswordRecoveryServiceProtocol

    init(dataStore: PasswordRecoveryDataStore = PasswordRecoveryDataStore(), service: PasswordRecoveryServiceProtocol = PasswordRecoveryService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping ([PasswordRecoveryModel]?, PasswordRecoveryProviderError?) -> Void) {
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
