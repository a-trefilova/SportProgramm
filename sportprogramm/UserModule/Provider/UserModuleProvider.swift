//
//  Created by Alyona Sabitskaya on 27/10/2020.
//

protocol UserModuleProviderProtocol {
    func getItems(completion: @escaping ([UserProgrammsModel]?, UserModuleProviderError?) -> Void)
}

enum UserModuleProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}

/// Отвечает за получение данных модуля UserModule
struct UserModuleProvider: UserModuleProviderProtocol {
    let dataStore: UserModuleDataStore
    let service: UserModuleServiceProtocol
    let mockData = MockUserProgrammsData()
    
    init(dataStore: UserModuleDataStore = UserModuleDataStore(), service: UserModuleServiceProtocol = UserModuleService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping ([UserProgrammsModel]?, UserModuleProviderError?) -> Void) {
     
//        if dataStore.models?.isEmpty == false {
//            return completion(self.dataStore.models, nil)
//        }
        service.fetchItems { (array, error) in
            if let error = error {
                completion(nil, .getItemsFailed(underlyingError: error))
            } else if let models = array {
                let newModel = UserProgrammsModel(uid: 1, email: "", name: "", userProgramms: self.mockData.programm.userProgramms)
                var arrayWithModel = models
                arrayWithModel.append(newModel)
                self.dataStore.models = arrayWithModel
                completion(arrayWithModel, nil)
            }
        }
    }
}
