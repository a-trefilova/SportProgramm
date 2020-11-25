//
//  Created by Alyona Sabitskaya on 15/11/2020.
//

protocol UserSettingsServiceProtocol {
    func fetchItems(completion: @escaping ([UserSettingsModel]?, Error?) -> Void)
}

/// Получает данные для модуля UserSettings
class UserSettingsService: UserSettingsServiceProtocol {

    func fetchItems(completion: @escaping ([UserSettingsModel]?, Error?) -> Void) {
        completion(nil, nil)
    }
}
