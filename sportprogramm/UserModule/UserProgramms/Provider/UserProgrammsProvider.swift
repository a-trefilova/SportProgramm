//
//  Created by Alyona Sabitskaya on 15/11/2020.
//

protocol UserProgrammsProviderProtocol {
    func getItems(completion: @escaping ([UserProgrammsModel]?, UserProgrammsProviderError?) -> Void)
}

enum UserProgrammsProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}

/// Отвечает за получение данных модуля UserProgramms
struct UserProgrammsProvider: UserProgrammsProviderProtocol {
    let dataStore: UserProgrammsDataStore
    let service: UserProgrammsServiceProtocol

    init(dataStore: UserProgrammsDataStore = UserProgrammsDataStore(), service: UserProgrammsServiceProtocol = UserProgrammsService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping ([UserProgrammsModel]?, UserProgrammsProviderError?) -> Void) {
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
