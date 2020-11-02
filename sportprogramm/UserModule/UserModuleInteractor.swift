//
//  UserModule module
//  Created by Alyona Sabitskaya on 27/10/2020.
//

protocol UserModuleBusinessLogic {
    func doSomething(request: UserModule.Something.Request)
}

/// Класс для описания бизнес-логики модуля UserModule
class UserModuleInteractor: UserModuleBusinessLogic {
    let presenter: UserModulePresentationLogic
    let provider: UserModuleProviderProtocol

    init(presenter: UserModulePresentationLogic, provider: UserModuleProviderProtocol = UserModuleProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Do something
    func doSomething(request: UserModule.Something.Request) {
        provider.getItems { (items, error) in
            let result: UserModule.UserModuleRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentSomething(response: UserModule.Something.Response(result: result))
        }
    }
}
