
protocol UserTrainingCalendarServiceProtocol {
    func fetchItems(completion: @escaping ([UserTrainingCalendarModel]?, Error?) -> Void)
}

class UserTrainingCalendarService: UserTrainingCalendarServiceProtocol {

    func fetchItems(completion: @escaping ([UserTrainingCalendarModel]?, Error?) -> Void) {
        completion(nil, nil)
    }
}
