//
//  Created by Alyona Sabitskaya on 15/11/2020.
//

protocol UserProgrammsServiceProtocol {
    func fetchItems(completion: @escaping ([UserProgrammsModel]?, Error?) -> Void)
}

/// Получает данные для модуля UserProgramms
class UserProgrammsService: UserProgrammsServiceProtocol {

    func fetchItems(completion: @escaping ([UserProgrammsModel]?, Error?) -> Void) {
        completion(nil, nil)
    }
}
