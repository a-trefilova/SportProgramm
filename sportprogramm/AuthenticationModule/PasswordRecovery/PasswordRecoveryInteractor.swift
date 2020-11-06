//
//  PasswordRecovery module
//  Created by Alyona Sabitskaya on 06/11/2020.
//

protocol PasswordRecoveryBusinessLogic {
    func doSomething(request: PasswordRecovery.Something.Request)
}

/// Класс для описания бизнес-логики модуля PasswordRecovery
class PasswordRecoveryInteractor: PasswordRecoveryBusinessLogic {
    let presenter: PasswordRecoveryPresentationLogic
    let provider: PasswordRecoveryProviderProtocol

    init(presenter: PasswordRecoveryPresentationLogic, provider: PasswordRecoveryProviderProtocol = PasswordRecoveryProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Do something
    func doSomething(request: PasswordRecovery.Something.Request) {
        provider.getItems { (items, error) in
            let result: PasswordRecovery.PasswordRecoveryRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentSomething(response: PasswordRecovery.Something.Response(result: result))
        }
    }
}
