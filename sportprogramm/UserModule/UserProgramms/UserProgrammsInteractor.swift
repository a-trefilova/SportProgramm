//
//  UserProgramms module
//  Created by Alyona Sabitskaya on 15/11/2020.
//

protocol UserProgrammsBusinessLogic {
    func doSomething(request: UserProgramms.Something.Request)
}

/// Класс для описания бизнес-логики модуля UserProgramms
class UserProgrammsInteractor: UserProgrammsBusinessLogic {
    let presenter: UserProgrammsPresentationLogic
    let provider: UserProgrammsProviderProtocol

    init(presenter: UserProgrammsPresentationLogic, provider: UserProgrammsProviderProtocol = UserProgrammsProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Do something
    func doSomething(request: UserProgramms.Something.Request) {
        provider.getItems { (items, error) in
            let result: UserProgramms.UserProgrammsRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentSomething(response: UserProgramms.Something.Response(result: result))
        }
    }
}
