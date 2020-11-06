//
//  Created by Alyona Sabitskaya on 06/11/2020.
//

protocol PasswordRecoveryServiceProtocol {
    func fetchItems(completion: @escaping ([PasswordRecoveryModel]?, Error?) -> Void)
}

/// Получает данные для модуля PasswordRecovery
class PasswordRecoveryService: PasswordRecoveryServiceProtocol {

    func fetchItems(completion: @escaping ([PasswordRecoveryModel]?, Error?) -> Void) {
        completion(nil, nil)
    }
}
