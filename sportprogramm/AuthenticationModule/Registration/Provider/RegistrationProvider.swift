//
//  Created by Alyona Sabitskaya on 06/11/2020.
//

protocol RegistrationProviderProtocol {
    func getItems(completion: @escaping ([RegistrationModel]?, RegistrationProviderError?) -> Void)
}

enum RegistrationProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}

/// Отвечает за получение данных модуля Registration
struct RegistrationProvider: RegistrationProviderProtocol {
    let dataStore: RegistrationDataStore
    let service: RegistrationServiceProtocol

    init(dataStore: RegistrationDataStore = RegistrationDataStore(), service: RegistrationServiceProtocol = RegistrationService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping ([RegistrationModel]?, RegistrationProviderError?) -> Void) {
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
