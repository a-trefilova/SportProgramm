//
//  Created by Alyona Sabitskaya on 27/10/2020.
//

protocol TrainerModuleServiceProtocol {
    func fetchItems(completion: @escaping ([TrainerModuleModel]?, Error?) -> Void)
}

/// Получает данные для модуля TrainerModule
class TrainerModuleService: TrainerModuleServiceProtocol {

    func fetchItems(completion: @escaping ([TrainerModuleModel]?, Error?) -> Void) {
        completion(nil, nil)
    }
}
