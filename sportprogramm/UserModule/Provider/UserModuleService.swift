//
//  Created by Alyona Sabitskaya on 27/10/2020.
//

protocol UserModuleServiceProtocol {
    func fetchItems(completion: @escaping ([UserProgrammsModel]?, Error?) -> Void)
}

/// Получает данные для модуля UserModule
class UserModuleService: UserModuleServiceProtocol {

    func fetchItems(completion: @escaping ([UserProgrammsModel]?, Error?) -> Void) {
        completion(nil, nil)
    }
}
