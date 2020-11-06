//
//  Registration module
//  Created by Alyona Sabitskaya on 06/11/2020.
//

protocol RegistrationBusinessLogic {
    func doSomething(request: Registration.Something.Request)
}

/// Класс для описания бизнес-логики модуля Registration
class RegistrationInteractor: RegistrationBusinessLogic {
    let presenter: RegistrationPresentationLogic
    let provider: RegistrationProviderProtocol

    init(presenter: RegistrationPresentationLogic, provider: RegistrationProviderProtocol = RegistrationProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Do something
    func doSomething(request: Registration.Something.Request) {
        provider.getItems { (items, error) in
            let result: Registration.RegistrationRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentSomething(response: Registration.Something.Response(result: result))
        }
    }
}
