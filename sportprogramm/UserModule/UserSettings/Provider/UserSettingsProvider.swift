//
//  Created by Alyona Sabitskaya on 15/11/2020.
//

protocol UserSettingsProviderProtocol {
    func getItems(completion: @escaping ([UserSettingsModel]?, UserSettingsProviderError?) -> Void)
}

enum UserSettingsProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}

/// Отвечает за получение данных модуля UserSettings
struct UserSettingsProvider: UserSettingsProviderProtocol {
    let dataStore: UserSettingsDataStore
    let service: UserSettingsServiceProtocol

    init(dataStore: UserSettingsDataStore = UserSettingsDataStore(), service: UserSettingsServiceProtocol = UserSettingsService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping ([UserSettingsModel]?, UserSettingsProviderError?) -> Void) {
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
