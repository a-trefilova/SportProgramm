//
//  Created by Alyona Sabitskaya on 15/11/2020.
//

protocol UserTrainingCalendarProviderProtocol {
    func getItems(completion: @escaping ([UserTrainingCalendarModel]?, UserTrainingCalendarProviderError?) -> Void)
}

enum UserTrainingCalendarProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}

/// Отвечает за получение данных модуля UserTrainingCalendar
struct UserTrainingCalendarProvider: UserTrainingCalendarProviderProtocol {
    let dataStore: UserTrainingCalendarDataStore
    let service: UserTrainingCalendarServiceProtocol

    init(dataStore: UserTrainingCalendarDataStore = UserTrainingCalendarDataStore(), service: UserTrainingCalendarServiceProtocol = UserTrainingCalendarService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping ([UserTrainingCalendarModel]?, UserTrainingCalendarProviderError?) -> Void) {
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
