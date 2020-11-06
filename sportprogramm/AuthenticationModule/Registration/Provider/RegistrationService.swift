//
//  Created by Alyona Sabitskaya on 06/11/2020.
//

protocol RegistrationServiceProtocol {
    func fetchItems(completion: @escaping ([RegistrationModel]?, Error?) -> Void)
}

/// Получает данные для модуля Registration
class RegistrationService: RegistrationServiceProtocol {

    func fetchItems(completion: @escaping ([RegistrationModel]?, Error?) -> Void) {
        completion(nil, nil)
    }
}
