//
//  Created by Alyona Sabitskaya on 27/10/2020.
//

protocol TrainerModuleProviderProtocol {
    func getItems(completion: @escaping ([TrainerModuleModel]?, TrainerModuleProviderError?) -> Void)
}

enum TrainerModuleProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}

/// Отвечает за получение данных модуля TrainerModule
struct TrainerModuleProvider: TrainerModuleProviderProtocol {
    let dataStore: TrainerModuleDataStore
    let service: TrainerModuleServiceProtocol

    init(dataStore: TrainerModuleDataStore = TrainerModuleDataStore(), service: TrainerModuleServiceProtocol = TrainerModuleService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping ([TrainerModuleModel]?, TrainerModuleProviderError?) -> Void) {
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
