//
//  Created by Alyona Sabitskaya on 15/11/2020.
//

protocol UserTrainingCalendarServiceProtocol {
    func fetchItems(completion: @escaping ([UserTrainingCalendarModel]?, Error?) -> Void)
}

/// Получает данные для модуля UserTrainingCalendar
class UserTrainingCalendarService: UserTrainingCalendarServiceProtocol {

    func fetchItems(completion: @escaping ([UserTrainingCalendarModel]?, Error?) -> Void) {
        completion(nil, nil)
    }
}
