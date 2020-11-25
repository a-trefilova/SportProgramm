//
//  UserTrainingCalendar module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

protocol UserTrainingCalendarBusinessLogic {
    func doSomething(request: UserTrainingCalendar.Something.Request)
}

/// Класс для описания бизнес-логики модуля UserTrainingCalendar
class UserTrainingCalendarInteractor: UserTrainingCalendarBusinessLogic {
    let presenter: UserTrainingCalendarPresentationLogic
    let provider: UserTrainingCalendarProviderProtocol

    init(presenter: UserTrainingCalendarPresentationLogic, provider: UserTrainingCalendarProviderProtocol = UserTrainingCalendarProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Do something
    func doSomething(request: UserTrainingCalendar.Something.Request) {
        provider.getItems { (items, error) in
            let result: UserTrainingCalendar.UserTrainingCalendarRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentSomething(response: UserTrainingCalendar.Something.Response(result: result))
        }
    }
}
