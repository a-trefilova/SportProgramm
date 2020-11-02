//
//  Created by Alyona Sabitskaya on 27/10/2020.
//

protocol authModuleServiceProtocol {
    func fetchItems(completion: @escaping ([authModuleModel]?, Error?) -> Void)
}

/// Получает данные для модуля authModule
class authModuleService: authModuleServiceProtocol {

    func fetchItems(completion: @escaping ([authModuleModel]?, Error?) -> Void) {
        completion(nil, nil)
    }
}
